# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Stages::Group do
  describe "#transpose" do
    it "should properly format nil" do
      expect(
          Aggregate::Stages::Group.new(id: nil, total: { "$sum": 1 }).transpose
        ).to eq('$group': { '_id': nil, 'total': { '$sum': 1 } })
    end

    it "should properly format" do
      expect(
          Aggregate::Stages::Group.new(id: "$_id", total: { "$sum": 1 }).transpose
        ).to eq('$group': { '_id': "$_id", 'total': { '$sum': 1 } })
    end

    it "properly formats a hash" do
      expect(Aggregate::Stages::Group.new(test: { test: :test }).transpose).to eq('$group': { test: { test: "test" } })
    end
  end

  describe "schema" do
    it "does not raise if the first key value is a string" do
      expect { Aggregate::Stages::Group.new(test: "1") }.not_to raise_error
    end

    it "should raise if additional key values are not and Integer, String or Hash" do
      expect { Aggregate::Stages::Group.new(id: nil, total: :test) }.to raise_error(ParamContractError)
    end
  end
end
