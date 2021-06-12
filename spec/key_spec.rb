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
  #   it "#create_keys can create keys" do
  #     key = Key.new(01234)
  #
  #     expect(key.create_keys).to be_an(Array)
  #   end
  end
end
