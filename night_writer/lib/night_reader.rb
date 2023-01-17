require_relative 'translator'

class NightReader < Translator
  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    super
  end
end

# night_reader = NightReader.new 

# night_reader.read_and_write