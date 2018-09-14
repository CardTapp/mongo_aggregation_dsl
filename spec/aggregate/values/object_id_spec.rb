# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Values::ObjectId do
  describe "#to_s" do
    it "raises if is_key is true" do
      expect { Aggregate::Values::ObjectId.new(BSON::ObjectId.new, true).to_s }.to raise_error(ArgumentError)
    end

    it "properly formats an object id" do
      id = BSON::ObjectId.new
      expect(Aggregate::Values::ObjectId.new(id, false).to_s).to eq "ObjectId('#{id}')"
    end
  end

  describe "#handles" do
    it "returns true for object id" do
      expect(Aggregate::Values::ObjectId.handles?(BSON::ObjectId.new)).to eq true
    end

    it "returns false for non object id" do
      expect(Aggregate::Values::ObjectId.handles?(1)).to eq false
    end
  end
end
