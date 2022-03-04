require 'simplecov'
SimpleCov.start
require_relative '../lib/welcome'

RSpec.describe Welcome do

  describe 'Iteration 1' do
    it "exists" do
      request = Welcome.new
      expect(request).to be_a(Welcome)
    end
  end
end
