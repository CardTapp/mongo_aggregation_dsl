# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Contracts::HashValueType do
  describe "#valid?" do
    it "is true if the hash values in the given range are of the correct type" do
      contract = Aggregate::Contracts::HashValueType.new(1..2, Symbol)
      expect(contract.valid?(one: 1, two: :two, three: :three)).to eq true
    end
    it "is false if the hash values in the given range are not of the correct type" do
      contract = Aggregate::Contracts::HashValueType.new(1..2, Symbol)
      expect(contract.valid?(one: 2, two: "two", three: :three)).to eq false
    end
    it "it can handle single value instead of range" do
      contract = Aggregate::Contracts::HashValueType.new(1, Symbol)
      expect(contract.valid?(one: "one", two: :two, three: "three")).to eq true
    end
  end
end
