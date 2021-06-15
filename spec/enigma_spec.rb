require_relative "spec_helper"

RSpec.describe Enigma do
  describe "instantiation" do
    it "::new" do
      enigma = Enigma.new

      expect(enigma).to be_an(Enigma)
    end

    it "has attributes" do
      enigma = Enigma.new

      expect(enigma.character_set).to be_an(Array)
      expect(enigma.key).to be_an(String)
      expect(enigma.date).to eq(Date.today.strftime("%d%m%y"))
    end
  end

  describe "methods" do

    # it "#find_shift(index) can identify indexes and apply correct shift" do
    #   enigma = Enigma.new
    #
    #   expect(enigma.find_shift(0)).to eq()
    # end

    it "#encrypt will return a hash with three keys" do
      enigma = Enigma.new
      expected = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                 }

      expect(enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
      # expect(expected[:key]).to eq("02715")
      # expect(enigma.date).to eq("040895")
    end

    it "#encrypt will return a hash with three keys without a date/key given" do
      enigma = Enigma.new

      expect(enigma.encrypt("hello world")).to be_a(Hash)
      # expect(expected[:key]).to eq("02715")
      # expect(enigma.date).to eq("040895")
    end
  end
end
