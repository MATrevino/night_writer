require_relative 'translator'
class NightWriter < Translator
  def initialize
    @read_file = ARGV[0]
    @write_file = ARGV[1]
    super
  end
end

night_writer = NightWriter.new 

night_writer.call

