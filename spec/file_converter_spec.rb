require 'simplecov'
SimpleCov.start
require './lib/file_converter'

RSpec.describe FileConverter do

  describe 'Iteration 1' do

    it "Is instantiated as an object" do
      translation = FileConverter.new(File.read("./lib/message.txt"))
      expect(translation).to be_a(FileConverter)
      # expect(translation.message).to eq("Created 'braille.txt' containing 256 characters")
    end

  end
end
