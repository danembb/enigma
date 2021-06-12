require_relative "spec_helper"

RSpec.describe Enigma do
  describe "instantiation" do
    it "::new" do
      enigma = Enigma.new

      expect(enigma).to be_an(Enigma)
    end
  end
end
