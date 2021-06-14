require_relative "spec_helper"

RSpec.describe Key do
  before :each do
    @key1 = Key.new
  end
  describe "instantiation" do
    it "::new" do
      expect(@key1).to be_a(Key)
    end
    #
    # it "has attributes" do
    #   expect(@key1.key).to eq([])
    # end
  end

  describe "methods" do
    it "#generate_key can generate a random sequence of integers" do

      expect(@key1.generate_key).to be_an(Integer)
    end

    it "#create_keys can create keys" do

      expect(@key1.create_keys).to be_an(Array)
    end

    it "#return_date returns today's date" do

      # expect(@key1.return_date).to eq(130621)
      expect(@key1.return_date).to be_a(String)
    end

    it "#date_squared squares #return_date as integer" do
      return_date = 130621

      expect(@key1.date_squared).to eq(17061845641)
    end

    it "#last_four_array returns an array containing the last 4 elements of #date_squared" do
      return_date = 130621

      expect(@key1.last_four_array).to eq(["5", "6", "4", "1"])
    end

    it "#offsets_as_strings will create an array with 4 subarrays" do
      return_date = 130621

      expect(@key1.offsets_as_strings).to eq([["5"], ["6"], ["4"], ["1"]])
    end

    it "#create_offsets will convert each subarray's string into integers" do
      return_date = 130621

      expect(@key1.create_offsets).to eq([[5], [6], [4], [1]])
    end

    it "#merp will transpose the final keys and offsets then sum each index pair" do
      return_date = 130621

      expect(@key1.merp).to be_an(Integer)
    end
  end
end
