require 'simplecov'
SimpleCov.start
require './lib/file_converter_braille'
require './lib/braille_english_map'

RSpec.describe FileConverterBraille do
  before(:each) do
    @file = './lib/braille.txt'
    @new_file = 'original_message.txt'
    @translation = FileConverterBraille.new(File.read(@file))
    ARGV = [@file, @new_file]
  end

  describe 'Iteration 3' do
    it 'is instantiated as an object' do
      expect(@translation).to be_a(FileConverterBraille)
    end

    it 'can read a file' do
      expect(@translation.file.lines[1]).to eq("0.00..0.0...0......0..0...00.0..0000.0.0..00.0......0........0000....0...0..0000\n")
    end

    it 'can create a new file with the same contents as the first' do
      expect(@translation.read_new_file[1]).to eq("0.00..0.0...0......0..0...00.0..0000.0.0..00.0......0........0000....0...0..0000\n")
    end

    it 'can read the file and print confirmation to the terminal' do
      expect(@translation.print_confirmation).to eq("Created 'original_message.txt' containing 41 characters")
    end

    xit 'has a map of all braille characters to english letters' do
      braille_to_english_map = BrailleEnglishMap.new(['0.','..','..'])
      braille_to_english_map.braille_parser
      expect(braille_to_english_map.characters).to eq("a")
    end

    it 'has braille characters within the limit' do
      braille_to_english_map = BrailleEnglishMap.new(['0.','..','..'])
      expect(@translation.characters_within_limit_array).to eq([".00.0.0.0....0..000.00000.0.0....00.0.0....00...0....00.00000.0..0..000.00...00.", "0.00..0.0...0......0..0...00.0..0000.0.0..00.0......0........0000....0...0..0000", "0.....0.0.........0.0.0"])
    end

    it 'translates a sinlge braille character' do
      braille_to_english_map = BrailleEnglishMap.new([".0", "0.", "0."])
      braille_to_english_map.braille_parser
      expect(braille_to_english_map.find_english_letter([".0", "0.", "0."])).to eq('s')
    end

    it 'can write a single translated character' do
      @translation.create_new_file
      @translation.update_new_file_to_english
      expect(@translation.print_confirmation).to eq("Created 'braille.txt' containing 1 characters")
    end

  end


end
