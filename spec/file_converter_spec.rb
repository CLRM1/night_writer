require 'simplecov'
SimpleCov.start
require './lib/file_converter'
require './lib/english_braille_map'

RSpec.describe FileConverter do
  before(:each) do
    @file = './lib/message.txt'
    @new_file = 'braille.txt'
    @translation = FileConverter.new(File.read(@file))
  end

  describe 'Iteration 1' do
    it 'Is instantiated as an object' do
      expect(@translation).to be_a(FileConverter)
    end

    it 'can read a file' do
      # require 'pry'; binding.pry
      expect(@translation.file.lines[1]).to eq("hello world!\n")
    end

    it 'can create a new file with the same contents as the first' do
      # require 'pry'; binding.pry
      ARGV = [@file, @new_file]
      translation = FileConverter.new(File.read(@file))
      translation.create_new_file
      expect(translation.read_new_file[1]).to eq("hello world!\n")
    end

    it 'can read the file and print confirmation to the terminal' do
      ARGV = [@file, @new_file]
      @translation = FileConverter.new(File.read(@file))
      @translation.create_new_file
      expect(@translation.print_confirmation).to eq("Created 'braille.txt' containing 13 characters")
    end
  end

  describe 'Iteration 2' do
    it 'has a map of english letters to braille characters' do
      english_to_braille_map = English_Braille_Map.new
      expect(english_to_braille_map.english_key_map).to be_a(Hash)
      # require 'pry'; binding.pry
      english_to_braille_map.letter_a_through_g
      english_to_braille_map.letters_h_through_n
      english_to_braille_map.letters_o_through_u
      english_to_braille_map.letters_v_through_z
      require 'pry'; binding.pry
      expect(english_to_braille_map.english_key_map[:a]).to eq(['0 .','. .','. .'])
      expect(english_to_braille_map.english_key_map[:h]).to eq(['0 .','0 0','. .'])
      expect(english_to_braille_map.english_key_map[:o]).to eq(['0 .','. 0','0 .'])
      expect(english_to_braille_map.english_key_map[:v]).to eq(['0 .','0 .','0 0'])
    end
  end
end
