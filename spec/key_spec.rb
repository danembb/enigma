require_relative "spec_helper"

RSpec.describe Key do
  describe "instantiation" do
    it "::new" do
      key = Key.new

      expect(key).to be_a(Key)
    end

    it "has attributes" do
      key = Key.new

      expect(key.key).to eq([])
    end
  end

  describe "methods" do
  #   it "#create_keys can create keys" do
  #     key = Key.new(01234)
  #
  #     expect(key.create_keys).to be_an(Array)
  #   end
  # end
end
