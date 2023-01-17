require './lib/translator'

RSpec.describe Translator do
  let(:translator) {Translator.new}
  let(:night_reader) {NightReader.new}
  let(:night_writer) {NightWriter.new}

  describe '#initalize' do
    it 'should initalize an instance of Translator' do
      expect(translator).to be_a(Translator)
    end
  end

  describe 'english to braille' do
    it 'should translate eng to braille' do
    expect(translator.english_to_braille("ab")).to eq([["0.", "..", ".."], ["00", "..", ".."]])
  end
end