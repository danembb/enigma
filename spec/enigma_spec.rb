require_relative "spec_helper"

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end

  describe "instantiation" do
    it "::new" do

      expect(@enigma).to be_an(Enigma)
    end

    it "has attributes" do

      expect(@enigma.character_set).to be_an(Array)
      expect(@enigma.key).to be_an(String)
      expect(@enigma.date).to eq(Date.today.strftime("%d%m%y"))
    end
  end

  describe "methods" do

    it "#keys can pull pairs out and combine them into final keys" do

      expect(@enigma.keys("02715")).to be_an(Array)
      expect(@enigma.keys("02715").length).to eq(4)
    end

    it "#date_squared squares #return_date as integer" do
      return_date = 130621

      expect(@enigma.date_squared(130621)).to be_an(Integer)
    end

    it "#last_four_array returns an array containing the last 4 elements of #date_squared" do
      return_date = 130621

      expect(@enigma.last_four_array(130621)).to eq(["5", "6", "4", "1"])
    end

    it "#offsets_as_strings can create an array with 4 subarrays" do
      return_date = 130621

      expect(@enigma.offsets_as_strings(130621)).to eq([["5"], ["6"], ["4"], ["1"]])
    end

    it "#offsets can convert each subarray's string into integers" do
      return_date = 130621

      expect(@enigma.offsets(130621)).to eq([5, 6, 4, 1])
    end

    it "#shifts can sum each array index position together" do
      return_date = 130621

      expect(@enigma.shifts("02715", 130621)).to be_an(Array)
      expect(@enigma.shifts("02715", 130621).length).to eq(4)
    end

    # it "#find_shift(index) can identify indexes and apply correct shift" do
    #
    #
    #   expect(@enigma.find_shift(0)).to eq()
    # end

    it "#encrypt will return a hash with three keys" do
      expected = {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
                 }

      expect(@enigma.encrypt("hello world", "02715", "040895")).to eq(expected)
      expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to be_a(Hash)
    end

    it "#encrypt will return a hash with three keys without a date/key given" do

      expect(@enigma.encrypt("hello world")).to be_a(Hash)
    end

    it "#encrypt & #decrypt will return a hash with three keys without a date/key given" do
      encrypted = @enigma.encrypt("hello world")
      decrypted = @enigma.decrypt(encrypted[:encryption], encrypted[:key], encrypted[:date])

      expect(encrypted).to be_a(Hash)
      expect(decrypted).to be_a(Hash)
      expect(decrypted[:decryption]).to eq("hello world")
    end
  end
end
