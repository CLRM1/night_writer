require 'simplecov'
SimpleCov.start
require './lib/file_converter_braille'

RSpec.describe FileConverterBraille do
  before(:each) do
    @file = './lib/braille.txt'
    @new_file = 'original_message.txt'
    @translation = FileConverterBraille.new(File.read(@file))
  end

  describe 'Iteration 3' do
    it 'is instantiated as an object' do
      expect(@translation).to be_a(FileConverterBraille)
    end

    it 'can read a file' do
      expect(@translation.file.lines[1]).to eq("hello world!\n")
    end

    it 'can create a new file with the same contents as the first' do
      ARGV = [@file, @new_file]
      translation = FileConverterBraille.new(File.read(@file))
      translation.create_new_file
      expect(translation.read_new_file[1]).to eq("hello world!\n")
    end

    it 'can read the file and print confirmation to the terminal' do
      ARGV = [@file, @new_file]
      @translation = FileConverterBraille.new(File.read(@file))
      @translation.create_new_file
      expect(@translation.print_confirmation).to eq("Created 'braille.txt' containing 13 characters")
    end
  end


end
