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

  xit 'can translate and wrap text longer than 80 characters' do
    expect(night_writer.translate("hello there you cool person that i enjoy")
  end
end
