class Translator
  attr_reader :braille_alphabet
  # attr_accessor :read_file,
  #               :write_file

  def initialize
    # @read_file = ARGV[0]
    # @write_file = ARGV[1]
    @braille_alphabet = 
      {
      'a' => ['0.', '..', '..'],
      'b' => ['0.', '0.', '..'],
      'c' => ['00', '..', '..'],
      'd' => ['00', '.0', '..'],
      'e' => ['0.', '.0', '..'],
      'f' => ['00', '0.', '..'],
      'g' => ['00', '00', '..'],
      'h' => ['0.', '00', '..'],
      'i' => ['.0', '0.', '..'],
      'j' => ['.0', '..', '..'],
      'k' => ['0.', '..', '0.'],
      'l' => ['0.', '0.', '0.'],
      'm' => ['00', '..', '0.'],
      'n' => ['00', '.0', '0.'],
      'o' => ['0.', '.0', '0.'],
      'p' => ['00', '0.', '0.'],
      'q' => ['00', '00', '0.'],
      'r' => ['0.', '00', '0.'],
      's' => ['.0', '0.', '0.'],
      't' => ['.0', '00', '0.'],
      'u' => ['0.', '..', '00'],
      'v' => ['0.', '0.', '00'],
      'w' => ['.0', '00', '.0'],
      'x' => ['00', '..', '00'],
      'y' => ['00', '.0', '00'],
      'z' => ['0.', '.0', '00'],
      " " => ["..", "..", ".."],
      "," => ["..", "0.", ".."],
      "'" => ["..", "..", "0."],
      "!" => ["..", "00", "0."],
      "?" => ["..", "0.", "00"]
    }
  end

  def call
    message_text = File.read(@read_file)
    
    translated = translate(message_text)
    require'pry';binding.pry
    puts "Created #{@write_file} contains #{translated.length} characters"
    
    File.write(@write_file, translated)
  end

  def bra_to_eng_alphabet
    @braille_alphabet.invert
  end
end