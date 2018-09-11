# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Contracts::StartsWith do
  describe "#valid?" do
    it "is true if the object as a string starts with the given value" do
      contract = Aggregate::Contracts::StartsWith.new("$")
      expect(contract.valid?("$test")).to eq true
    end
    it "is true if the hash greater than min length" do
      contract = Aggregate::Contracts::StartsWith.new("$")
      expect(contract.valid?("test")).to eq false
    end
  end
end
