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

    xit 'can read a file' do
      expect(@translation.file.lines[1]).to eq("hello world!\n")
    end

    xit 'can create a new file with the same contents as the first' do
      ARGV = [@file, @new_file]
      translation = FileConverter.new(File.read(@file))
      translation.create_new_file
      expect(translation.read_new_file[1]).to eq("hello world!\n")
    end

    xit 'can read the file and print confirmation to the terminal' do
      ARGV = [@file, @new_file]
      @translation = FileConverter.new(File.read(@file))
      @translation.create_new_file
      expect(@translation.print_confirmation).to eq("Created 'braille.txt' containing 13 characters")
    end
  end

  describe 'Iteration 2' do
    it 'has a map of english letters to braille characters' do
      english_to_braille_map = English_Braille_Map.new(:a)
      expect(english_to_braille_map.english_key_map).to be_a(Hash)
      english_to_braille_map.letters_a_through_g
      english_to_braille_map.letters_h_through_n
      english_to_braille_map.letters_o_through_u
      english_to_braille_map.letters_v_through_z
      expect(english_to_braille_map.english_key_map[:a]).to eq(['0 .','. .','. .'])
      expect(english_to_braille_map.english_key_map[:h]).to eq(['0 .','0 0','. .'])
      expect(english_to_braille_map.english_key_map[:o]).to eq(['0 .','. 0','0 .'])
      expect(english_to_braille_map.english_key_map[:v]).to eq(['0 .','0 .','0 0'])
    end

    it 'has a map of all english letters' do
      english_to_braille_map = English_Braille_Map.new(:a)
      english_to_braille_map.all_letters
      expect(english_to_braille_map.english_key_map[:r]).to eq(['0 .','0 0','0 .'])
      expect(english_to_braille_map.english_key_map[:z]).to eq(['0 .','. 0','0 0'])
    end

    xit 'it finds a single english lowercase letter' do
      english_to_braille_map = English_Braille_Map.new(:a)
      english_to_braille_map.all_letters
      expect(english_to_braille_map.find_braille_char(:a)).to eq('0 .
                                                                 . .
                                                                 . .
                                                                 . .')
    end

    it 'can read the original file and return a single braille character in the new file' do
      ARGV = [@file, @new_file]
      @translation = FileConverter.new(File.read(@file))
      @translation.create_new_file
      @translation.update_new_file_to_braille
      expect(@translation.print_confirmation).to eq("Created 'braille.txt' containing 1 characters")
    end

    it 'can read the original file and return multiple braille characters in the new file' do
      ARGV = [@file, @new_file]
      @translation = FileConverter.new(File.read(@file))
      @translation.create_new_file
      @translation.update_new_file_to_braille
      expect(@translation.print_confirmation).to eq("Created 'braille.txt' containing 2 characters")
    end

    it 'creates a new line when the number of braille characters exceedes 80 (40 english characters)' do
      ARGV = [@file, @new_file]
      @translation = FileConverter.new(File.read(@file))
      @translation.create_new_file
      @translation.update_new_file_to_braille
      expect(@translation.braille_characater_count).to eq(240)
    end
  end
end
