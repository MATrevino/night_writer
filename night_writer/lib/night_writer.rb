require_relative 'translator'
class NightWriter < Translator
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
    
    puts "Created #{@write_file} contains #{translated.delete("\n").length/6} characters"
    File.write(@write_file, translated)
  end

  def translate(message_text)    
    braille_array = message_text.chars.filter_map do |letter|
      @braille_alphabet[letter]
    end
    sliced_array = braille_array.transpose.map do |braille|
      braille.join.chars.each_slice(80).map do |slice|
        slice.join
      end
    end.transpose.join("\n")
  end
end
  
night_writer = NightWriter.new 

night_writer.call

