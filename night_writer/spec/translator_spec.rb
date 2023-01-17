require './lib/translator'

RSpec.describe Translator do
  let(:translator) {Translator.new}
  let(:night_reader) {NightReader.new}
  let(:night_writer) {NightWriter.new}

  it 'should initalize an instance of Translator' do
    expect(translator).to be_a(Translator)
  end

  it 'return an inverted alphabet' do
    expected = {
      ["0.", "..", ".."]=>"a",
      ["00", "..", ".."]=>"b",
      ["0.", ".0", ".."]=>"c",
      ["0.", ".0", "0."]=>"d",
      ["0.", "..", "0."]=>"e",
      ["00", ".0", ".."]=>"f",
      ["00", ".0", "0."]=>"g",
      ["00", "..", "0."]=>"h",
      [".0", ".0", ".."]=>"i",
      [".0", ".0", "0."]=>"j",
      ["0.", "0.", ".."]=>"k",
      ["00", "0.", ".."]=>"l",
      ["0.", "00", ".."]=>"m",
      ["0.", "00", "0."]=>"n",
      ["0.", "0.", "0."]=>"o",
      ["00", "00", ".."]=>"p",
      ["00", "00", "0."]=>"q",
      ["00", "0.", "0."]=>"r",
      [".0", "00", ".."]=>"s",
      [".0", "00", "0."]=>"t",
      ["0.", "0.", ".0"]=>"u",
      ["00", "0.", ".0"]=>"v",
      [".0", ".0", "00"]=>"w",
      ["0.", "00", ".0"]=>"x",
      ["0.", "00", "00"]=>"y",
      ["0.", "0.", "00"]=>"z",
      ["..", "..", ".."]=>" " 
    }
    expect(translator.bra_to_eng_alphabet).to eq(expected)
  end

  xit 'should translate eng to braille' do
  expect(translator.english_to_braille("ab")).to eq([["0.", "..", ".."], ["00", "..", ".."]])
  end
  
  # it 'can translate to english from braille' do
  #   expect(night_reader.translate_to_english("0.\n..\n..")).to eq("a")
  # end
end