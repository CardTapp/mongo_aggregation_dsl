# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Stages::Group do
  describe "#transpose" do
    it "should properly format" do
      expect(
        Aggregate::Stages::Group.new(id: nil, total: { "$sum": 1 }).transpose
      ).to eq('$group': { '_id': nil, 'total': { '$sum': 1 } })
    end
  end
  describe "schema" do
    it "should raise if the first key value is a hash" do
      expect { Aggregate::Stages::Group.new(test: { test: :test }) }.to raise_error(ParamContractError)
    end
    it "does not raise if the first key value is a string" do
      expect { Aggregate::Stages::Group.new(test: "1") }.not_to raise_error
    end
    it "should raise if additional key values are not hashes" do
      expect { Aggregate::Stages::Group.new(id: nil, total: 1) }.to raise_error(ParamContractError)
    end
  end
end
