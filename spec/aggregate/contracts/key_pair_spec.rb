# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Contracts::KeyPair do
  describe "#valid?" do
    it "is true if each hash key in range is an allowed type" do
      contract = Aggregate::Contracts::KeyPair.new(0..1, [Origin::Key, String],[String])
      expect(contract.valid?(
          "one" => "1",
          Origin::Key.new("age", "$gt", "$gt") => "two")).to eq true
    end
    it "is false if a hash key in range is not an allowed type" do
      contract = Aggregate::Contracts::KeyPair.new(0..2, [String],[String])
      expect(contract.valid?(
          "one" => "1",
          Origin::Key.new("age", "$gt", "$gt") => "two")).to eq false
    end
    it "it ignores keys not in range" do
      contract = Aggregate::Contracts::KeyPair.new(1..2, [String], [String])
      expect(contract.valid?(
          key: "1",
          "a" => "two",
          "b" => "two")).to eq true
    end
    it "is true if key range is not in actual supplied range" do
      contract = Aggregate::Contracts::KeyPair.new(1..2, [String])
      expect(contract.valid?(key: "1")).to eq true
    end

    it "is true if value in range is of the specified types" do
      contract = Aggregate::Contracts::KeyPair.new(0..1, [String],[String, Integer])
      expect(contract.valid?(
          "one" => "1",
          "two" => 1)).to eq true
    end

    it "is false if value in range is not of the specified types" do
      contract = Aggregate::Contracts::KeyPair.new(0..1, [String], [String])
      expect(contract.valid?(
          "one" => "1",
          "two" => 1)).to eq false
    end

    it "is true when values are allowed to be of multiple types" do
      contract = Aggregate::Contracts::KeyPair.new(0..1, [String], [String, Integer])
      expect(contract.valid?(
          "one" => "1",
          "two" => 1)).to eq true
    end
  end
end
