require 'simplecov'
SimpleCov.start
require './lib/file_converter'

RSpec.describe FileConverter do

  before(:each) do
    @file = "./lib/message.txt"
    @file_2 = "braille.txt"
    # @translation = FileConverter.new(File.read(@file))
  end

  describe 'Iteration 1' do

    xit "Is instantiated as an object" do
      expect(@translation).to be_a(FileConverter)
    end

    xit "can read a file" do
      # require 'pry'; binding.pry
      expect(@translation.file.lines[1]).to eq("hello world!\n")
    end

    it "can create a new file with the same contents as the first" do
      # require 'pry'; binding.pry
      ARGV = [@file, @file_2]
      translation = FileConverter.new(File.read(@file))
      translation.create_new_file
      expect(translation.new_braille_file.lines[1]).to eq("hello world!\n")
    end

    xit "can read the new file" do
      ARGV = [@file, @file_2]
      @translation = FileConverter.new(File.read(@file))
      @translation.create_new_file
      expect(@translation.read_new_file).to eq("Created 'braille.txt' containing 256 characters")
    end

  end
end
