require_relative 'translator'

class NightReader < Translator
  attr_accessor :read_file,
                :write_file

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    super
  end

  def call
    message_text = File.read(@read_file)
    
    translated = translate(message_text)
    
    puts "Created #{@write_file} contains #{translated.delete("\n").length} characters"
    File.write(@write_file, translated)
  end
  
  def translate(message_text)
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
  night_reader = NightReader.new 
  
  night_reader.call