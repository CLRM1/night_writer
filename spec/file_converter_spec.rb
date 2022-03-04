require 'simplecov'
SimpleCov.start
require './lib/english_to_braille'

RSpec.describe FileConverter do

  describe 'Iteration 1' do

    xit "Is instantiated as an object" do
      translation = New_.new
      expect(translation).to be_a(FileConverter)
      # expect(translation.message).to eq("Created 'braille.txt' containing 256 characters")
    end

  end
end
