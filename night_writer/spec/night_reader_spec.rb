require_relative 'spec_helper'

RSpec.describe NightReader do
  let(:night_reader) {NightReader.new}
  before do
    night_reader.read_file = './braille.txt'
    night_reader.write_file = './original_message.txt'
  end
  it 'exists' do
    expect(night_reader).to be_a(NightReader)
  end

  it 'has attributes' do
    night_reader.call
    expect(night_reader.read_file).to eq('./braille.txt')
    expect(night_reader.write_file).to eq('./original_message.txt')
  end

  it 'can translate eng to braille' do
    expect(night_reader.translate("00\n..\n0.")).to eq("h")
  end
  
  it 'can translate two letters to braille' do
    expect(night_reader.translate("00.0\n...0\n0...")).to eq("hi")
  end

  it 'can translate and wrap text' do
    expected = "the quick brown fox jumps over the lazy dog"
    expect(night_reader.translate(".0000...000..00.0...00000..00...000.0....00.0.00.0..0.000.00...0000...000.0.0...\n00......000..0.00.......0..0..........0.0.000.....0..0..0..0........0..00.0...0.0.0.......0000..\n0.0.00\n.00..0\n0.0.0.")).to eq(expected)
  end
end

