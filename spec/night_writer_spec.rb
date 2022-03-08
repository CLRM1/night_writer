require 'simplecov'
SimpleCov.start
require './lib/file_converter_english'
require './lib/english_braille_map'

RSpec.describe FileConverterEnglish do
  before(:each) do
    @file = './lib/test_message.txt'
    @new_file = 'braille.txt'
    @translation = FileConverterEnglish.new(File.read(@file))
  end

  describe 'Iterations and 2' do
    it 'is instantiated as an object' do
      expect(@translation).to be_a(FileConverterEnglish)
    end

    it 'has a map of english letters to braille characters' do
      english_to_braille_map = EnglishBrailleMap.new('abc')
      expect(english_to_braille_map.english_key_map).to be_a(Hash)
      english_to_braille_map.letters_a_through_g
      english_to_braille_map.letters_h_through_n
      english_to_braille_map.letters_o_through_u
      english_to_braille_map.letters_v_through_z_and_space
      expect(english_to_braille_map.english_key_map[:a]).to eq(['0.','..','..'])
      expect(english_to_braille_map.english_key_map[:h]).to eq(['0.','00','..'])
      expect(english_to_braille_map.english_key_map[:o]).to eq(['0.','.0','0.'])
      expect(english_to_braille_map.english_key_map[:v]).to eq(['0.','0.','00'])
    end

    it 'has a map of all english letters' do
      english_to_braille_map = EnglishBrailleMap.new('abc')
      english_to_braille_map.all_letters
      expect(english_to_braille_map.english_key_map[:r]).to eq(['0.','00','0.'])
      expect(english_to_braille_map.english_key_map[:z]).to eq(['0.','.0','00'])
    end

    it 'parses letters' do
      english_to_braille_map = EnglishBrailleMap.new(['abcdefghijklmnopqrstuvwxyz'])
      expect(english_to_braille_map.letter_parser).to eq([[:a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m, :n, :o, :p, :q, :r, :s, :t, :u, :v, :w, :x, :y, :z]])
    end

    it 'can read the original file and return multiple braille characters in the new file' do
      ARGV = [@file, @new_file]
      @translation = FileConverterEnglish.new(File.read(@file))
      @translation.create_new_file
      @translation.update_new_file_to_braille
      expect(@translation.print_confirmation).to eq("Created 'braille.txt' containing 11 characters")
    end

    it 'creates a new line when the number of braille characters exceedes 80 (40 english characters)' do
      ARGV = [@file, @new_file]
      @translation = FileConverterEnglish.new(File.read(@file))
      @translation.create_new_file
      @translation.update_new_file_to_braille
      expect(@translation.braille_characater_count).to eq(66)
    end
  end
end
