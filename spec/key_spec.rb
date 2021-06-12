require_relative "spec_helper"

RSpec.describe Key do
  describe "instantiation" do
    it "::new" do
      key = Key.new(01234)

      expect(key).to be_a(Key)
    end

    it "has attributes" do
      key = Key.new(01234)

      expect(key.key).to eq(01234)
    end
  end
end
