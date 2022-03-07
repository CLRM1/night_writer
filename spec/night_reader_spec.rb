require 'simplecov'
SimpleCov.start
require './lib/file_converter'
require './lib/english_braille_map'

RSpec.describe FileConverterBraille do
  before(:each) do
    @file = './lib/message.txt'
    @new_file = 'braille.txt'
    @translation = FileConverter.new(File.read(@file))
  end

  describe 'Iteration 3' do
    it 'Is instantiated as an object' do
      expect(@translation).to be_a(FileConverterBraille)
    end
  end


end
