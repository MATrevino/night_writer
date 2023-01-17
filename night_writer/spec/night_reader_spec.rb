require_relative 'spec_helper'

RSpec.describe NightReader do
  let(:night_reader) {NightReader.new}

  before do
    night_reader.read_file = './test_braille.txt'
    night_reader.write_file = './test_original_message.txt'
  end

  it 'exists' do
    expect(night_reader).to be_a(NightReader)
  end

  it 'has attributes' do
    expect(night_reader.read_file).to eq('./test_braille.txt')
    expect(night_reader.write_file).to eq('./test_original_message.txt')
  end
  
  it 'can #call' do
    night_reader.call
    expect(File.read('./test_original_message.txt')).to eq("hi")
  end
  
  it 'can translate eng to braille' do
    expect(night_reader.translate("0.\n00\n..")).to eq("h")
  end
  
  it 'can translate two letters to braille' do
    expect(night_reader.translate("0..0\n000.\n....")).to eq("hi")
  end

  it 'can translate and wrap text' do
    expect(night_reader.translate(".00.0...000..0000...0.0.0..000..000.00...00.0000.0..0.0.0.0....00.0...0.0.0.00..000.00\n0000.0..00..0.......0.00.000.0..0..0..........0.0....00..000..0000.0..0....0.0...0.000\n0.......0.00....0.....0.0..00.....0.00....000.0.0...0.00..0...0.......0...0000....0...")).to eq("the quick brown fox jumps over the lazy \ndog")
  end
end

