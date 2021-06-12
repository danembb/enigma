require_relative "spec_helper"

RSpec.describe Key do
  describe "instantiation" do
    it "::new" do
      key = Key.new(01234)

      expect(key).to be_a(Key)
    end
  end
end
