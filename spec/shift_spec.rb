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
    it "#return_date returns today's date" do

      expect(@shift.return_date).to be_a(String)
    end
  end
end
