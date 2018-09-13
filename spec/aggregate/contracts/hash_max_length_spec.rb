# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Contracts::HashMaxLength do
  describe "#valid?" do
    it "is true if the hash is less than max length" do
      contract = Aggregate::Contracts::HashMaxLength.new(2)
      expect(contract.valid?({one: :one})).to eq true
    end
    it "is true if the hash equal to the max length" do
      contract = Aggregate::Contracts::HashMaxLength.new(2)
      expect(contract.valid?({one: :one, two: :two})).to eq true
    end
    it "is false if the hash is greater than max length" do
      contract = Aggregate::Contracts::HashMaxLength.new(2)
      expect(contract.valid?({one: :one, two: :two, three: :three})).to eq false
    end
  end
end
