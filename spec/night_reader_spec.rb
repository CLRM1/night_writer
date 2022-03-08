require 'simplecov'
SimpleCov.start
require './lib/file_converter_braille'
require './lib/braille_to_english_dictionary'

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

    it 'has a map of all braille characters to english letters' do
      braille_to_english_dictionary = Braille_to_english_dictionary.new(['0.','..','..'])
      braille_to_english_dictionary.braille_parser
      braille_to_english_dictionary.all_letters
      expect(braille_to_english_dictionary.braille_key_map).to eq({["0.", "..", ".."]=>"a",
                                                           ["0.", "0.", ".."]=>"b",
                                                           ["00", "..", ".."]=>"c",
                                                           ["00", ".0", ".."]=>"d",
                                                           ["0.", ".0", ".."]=>"e",
                                                           ["00", "0.", ".."]=>"f",
                                                           ["00", "00", ".."]=>"g",
                                                           ["0.", "00", ".."]=>"h",
                                                           [".0", "0.", ".."]=>"i",
                                                           [".0", "00", ".."]=>"j",
                                                           ["0.", "..", "0."]=>"k",
                                                           ["0.", "0.", "0."]=>"l",
                                                           ["00", "..", "0."]=>"m",
                                                           ["00", ".0", "0."]=>"n",
                                                           ["0.", ".0", "0."]=>"o",
                                                           ["00", "0.", "0."]=>"p",
                                                           ["00", "00", "0."]=>"q",
                                                           ["0.", "00", "0."]=>"r",
                                                           [".0", "0.", "0."]=>"s",
                                                           [".0", "00", "0."]=>"t",
                                                           ["0.", "..", "00"]=>"u",
                                                           ["0.", "0.", "00"]=>"v",
                                                           [".0", "00", ".0"]=>"w",
                                                           ["00", "..", "00"]=>"x",
                                                           ["00", ".0", "00"]=>"y",
                                                           ["0.", ".0", "00"]=>"z",
                                                           ["..", "..", ".."]=>" "
                                                           })
    end

    it 'translates a sinlge braille character and has braille characters within the limit' do
      braille_to_english_dictionary = Braille_to_english_dictionary.new(['a'])
      expect(@translation.characters_within_limit_array).to eq(["0.", "00", ".."])
    end

    it 'can write a single translated character' do
      @translation.create_new_file
      @translation.update_new_file_to_english
      expect(@translation.print_confirmation).to eq("Created 'original_message.txt' containing 68 characters")
    end

  end


end
