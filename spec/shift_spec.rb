require_relative "spec_helper"

RSpec.describe Shift do
  before :each do
    @shift = Shift.new
  end
  
  describe "instantiation" do
    it "::new" do
      expect(@shift).to be_a(Shift)
    end

    it "has attributes" do
      expect(@shift.key).to be_a(String)
    end
  end

  describe "methods" do
    it "#keys can pull pairs out and combine them into final keys" do

      expect(@shift.keys).to be_an(Array)
      expect(@shift.keys.length).to eq(4)
    end

    it "#return_date returns today's date" do

      expect(@shift.return_date).to be_a(String)
    end

    it "#date_squared squares #return_date as integer" do
      return_date = 130621

      expect(@shift.date_squared).to be_an(Integer)
    end

    it "#last_four_array returns an array containing the last 4 elements of #date_squared" do
      return_date = 130621

      expect(@shift.last_four_array).to eq(["5", "6", "4", "1"])
    end

    it "#offsets_as_strings can create an array with 4 subarrays" do
      return_date = 130621

      expect(@shift.offsets_as_strings).to eq([["5"], ["6"], ["4"], ["1"]])
    end

    it "#offsets can convert each subarray's string into integers" do
      return_date = 130621

      expect(@shift.offsets).to eq([5, 6, 4, 1])
    end

    it "#shifts can sum each array index position together" do
      return_date = 130621

      expect(@shift.shifts).to be_an(Array)
    end
  end
end
