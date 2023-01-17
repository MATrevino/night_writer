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

  it 'has attributes' do
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

  it 'can translate and wrap text' do
    expected = ".0000...000..00.0...00000..00...000.0....00.0.00.0..0.000.00...0000...000.0.0...\n00......000..0.00.......0..0..........0.0.000.....0..0..0..0........0..00.0...0.0.0.......0000..\n0.0.00\n.00..0\n0.0.0."
    expect(night_writer.translate("the quick brown fox jumps over the lazy dog")).to eq(expected)
  end
end
