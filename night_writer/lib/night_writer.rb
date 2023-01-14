class NightWriter
  attr_accessor :read_file,
                :write_file

  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
  end
  
  def call
  message_file = File.open(@read_file, "r")

  message = message_file.read
  
  char_count = message.chars.count
  
  puts "Created #{@write_file} contains #{char_count} characters"
 
  File.write(@write_file, message)

  end

  # def translate_to_braille

  # end
end

# night_writer = NightWriter.new 

# night_writer.call

