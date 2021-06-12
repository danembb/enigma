require_relative "spec_helper"

RSpec.describe Message do
  before :each do
    @message = Message.new
  end

  describe "instantiation" do
    it "::new" do
      expect(@message).to be_a(Message)
    end
  end

  describe "methods" do
    it "#welcome can display a welcome message" do
      expect(@message.welcome).to be_a(String)
    end
  end
end
