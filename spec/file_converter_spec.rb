require 'simplecov'
SimpleCov.start
require './lib/file_converter'

RSpec.describe FileConverter do

  before(:each) do
    @translation = FileConverter.new(File.read("./lib/message.txt"))
  end

  describe 'Iteration 1' do

    it "Is instantiated as an object" do
      expect(@translation).to be_a(FileConverter)
    end

    it "can read a file" do
      # require 'pry'; binding.pry
      expect(@translation.file.lines[1]).to eq("hello world!\n")
    end

    it "can create a new file" do
      expect(@translation)
    end

  end
end
