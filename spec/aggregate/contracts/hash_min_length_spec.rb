# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Contracts::HashMinLength do
  describe "#valid?" do
    it "is true if the hash is equal to min length" do
      contract = Aggregate::Contracts::HashMinLength.new(2)
      expect(contract.valid?({one: :one, two: :two})).to eq true
    end
    it "is true if the hash greater than min length" do
      contract = Aggregate::Contracts::HashMinLength.new(2)
      expect(contract.valid?({one: :one, two: :two, three: :three})).to eq true
    end
    it "is false if the hash less than min length" do
      contract = Aggregate::Contracts::HashMinLength.new(2)
      expect(contract.valid?({one: :one})).to eq false
    end
  end
end
