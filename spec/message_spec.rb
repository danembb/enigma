require_relative "spec_helper"

RSpec.describe Message do
  describe "instantiation" do
    it "::new" do
      message = Message.new

      expect(message).to be_a(Message)
    end
  end
end
