class NightReader
  attr_accessor :read_file,
                :write_file

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    @bra_to_eng_alphabet = {
      ["0.", "..", ".."] => "a",
      ["00", "..", ".."] => "b",
      ["0.", ".0", ".."] => "c",
      ["0.", ".0", "0."] => "d",
      ["0.", "..", "0."] => "e",
      ["00", ".0", ".."] => "f",
      ["00", ".0", "0."] => "g",
      ["00", "..", "0."] => "h",
      [".0", ".0", ".."] => "i",
      [".0", ".0", "0."] => "j",
      ["0.", "0.", ".."] => "k",
      ["00", "0.", ".."] => "l",
      ["0.", "00", ".."] => "m",
      ["0.", "00", "0."] => "n",
      ["0.", "0.", "0."] => "o",
      ["00", "00", ".."] => "p",
      ["00", "00", "0."] => "q",
      ["00", "0.", "0."] => "r",
      [".0", "00", ".."] => "s",
      [".0", "00", "0."] => "t",
      ["0.", "0.", ".0"] => "u",
      ["00", "0.", ".0"] => "v",
      [".0", ".0", "00"] => "w",
      ["0.", "00", ".0"] => "x",
      ["0.", "00", "00"] => "y",
      ["0.", "0.", "00"] => "z",
      ["..", "..", ".."] => " "      
    }
  end

  def read_and_write
    message_text = File.read(@read_file)
    character_count = message_text.delete("\n").chars.count
    
    puts "Created #{@write_file} contains #{character_count} characters"
    
    translated = translate_to_english(message_text)
    
    File.write(@write_file, translated)
  end
  
  def translate_to_english(message_text)
    br_message_array = []
    br_message_array << message_text.split

    split_array = []
    br_message_array.map do |braille|
      braille.each do |row|
        split_array << row.chars.each_slice(2).map(&:join)
      end
    end
    require'pry';binding.pry
    
    in_eng = []
    split_array.transpose.map do |letter|
      in_eng << @bra_to_eng_alphabet[letter]
    end
    
    if in_eng.count >= 40
      in_eng.each_slice(40).map(&:join).join("\n")
    else
      in_eng.join
    end
  end
end

night_reader = NightReader.new 

night_reader.read_and_write