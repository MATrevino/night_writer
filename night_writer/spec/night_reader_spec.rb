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
    night_reader.read_and_write
    expect(night_reader.read_file).to eq('./braille.txt')
    expect(night_reader.write_file).to eq('./original_message.txt')
  end

  it 'can translate to english from braille' do
    expect(night_reader.translate_to_english("0.\n..\n..")).to eq("a")
  end
end

