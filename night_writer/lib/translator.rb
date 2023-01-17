class Translator
  attr_accessor :read_file,
                :write_file

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    @braille_alphabet = {
      "a" => ["0.", "..", ".."],
      "b" => ["00", "..", ".."],
      "c" => ["0.", ".0", ".."],
      "d" => ["0.", ".0", "0."],
      "e" => ["0.", "..", "0."],
      "f" => ["00", ".0", ".."],
      "g" => ["00", ".0", "0."],
      "h" => ["00", "..", "0."],
      "i" => [".0", ".0", ".."],
      "j" => [".0", ".0", "0."],
      "k" => ["0.", "0.", ".."],
      "l" => ["00", "0.", ".."],
      "m" => ["0.", "00", ".."],
      "n" => ["0.", "00", "0."],
      "o" => ["0.", "0.", "0."],
      "p" => ["00", "00", ".."],
      "q" => ["00", "00", "0."],
      "r" => ["00", "0.", "0."],
      "s" => [".0", "00", ".."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "0.", ".0"],
      "v" => ["00", "0.", ".0"],
      "w" => [".0", ".0", "00"],
      "x" => ["0.", "00", ".0"],
      "y" => ["0.", "00", "00"],
      "z" => ["0.", "0.", "00"],
      " " => ["..", "..", ".."],
      "!" => ["..", "00", "0."]
      }
  end

  def call
    message_in_eng = File.read(@read_file)
    
    char_count = message_in_eng.chars.count
    
    puts "Created #{@write_file} contains #{char_count} characters"
   
    translated_text = translate_to_braille(message_in_eng)
  
    File.write(@write_file, translated_text)
  
  end

  def translate_to_braille(message_in_eng)    
    braille_array = message_in_eng.chars.filter_map do |letter|
      @braille_alphabet[letter]
    end
    sliced_array = braille_array.transpose.map do |braille|
      braille.join.chars.each_slice(80).map do |slice|
        slice.join
      end
    end.transpose.join("\n")
  end

  def read_and_write
    message_text = File.read(@read_file)
    character_count = (message_text.delete("\n").chars.count)/6
    
    message_file_characters_eng
    translated = translate_to_english(message_text)
    
    File.write(@write_file, translated)
  end

  def message_file_characters_eng
    puts "Created #{@write_file} contains #{character_count} characters"
  end

  def bra_to_eng_alphabet
    @braille_alphabet.invert
  end

  def translate_to_english(message_text)
    br_message_array = []
    br_message_array << message_text.split

    array_with_three_rows = []
    split_array = []
    br_message_array.map do |braille|
      
      top_row = (braille.select.with_index{|_,i| (i+3) % 3 == 0}).join
      middle_row = (braille.select.with_index{|_,i| (i+3) % 3 == 1}).join
      bottom_row = (braille.select.with_index{|_,i| (i+3) % 3 == 2}).join

      array_with_three_rows = [top_row, middle_row, bottom_row]
      array_with_three_rows.each do |row|
        split_array << row.chars.each_slice(2).map(&:join)
      end
    end
    
    in_eng = []
    split_array.transpose.map do |letter|
      in_eng << bra_to_eng_alphabet[letter]
    end
    
    if in_eng.count >= 40
      in_eng.each_slice(40).map(&:join).join("\n")
    else
      in_eng.join
    end
  end
end
