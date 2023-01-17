require_relative 'spec_helper'


RSpec.describe NightWriter do
  let(:night_writer) {NightWriter.new}
  before do
    night_writer.read_file = './message.txt'
    night_writer.write_file = './braille.txt'
  end

  it 'exists' do
    expect(night_writer).to be_a(NightWriter)
  end

  it 'can call on class with read and write files' do
    night_writer.call
    expect(night_writer.read_file).to eq('./message.txt')
    expect(night_writer.write_file).to eq('./braille.txt')
  end

  it 'can translate eng to braille' do
    expect(night_writer.translate("h")).to eq("00\n..\n0.")
  end
  
  it 'can translate two letters to braille' do
    expect(night_writer.translate("hi")).to eq("00.0\n...0\n0...")
  end
end
