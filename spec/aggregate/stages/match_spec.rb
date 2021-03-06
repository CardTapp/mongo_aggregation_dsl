# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Stages::Match do
  describe "#transpose" do
    it "should properly format" do
      expect(
          Aggregate::Stages::Match.new(
              :expr.and => [
                  { eq: %w[$user_id $$user_id] },
                  { :not.in => ["$name", %w[1 2]] }
              ]
            ).transpose
        ).to eq('$match': { "$expr" => { "$and" => [{ "$eq" => ["$user_id", "$$user_id"] }, { "$not" => { "$in" => ["$name", %w[1 2]] } }] } })
    end
  end
  describe "schema" do
    it "should not raise if key is an Mongoid::Criteria::Queryable::Key" do
      expect { Aggregate::Stages::Match.new(:expr.and => []) }.not_to raise_error
    end

    it "should not raise if key is a Symbol" do
      expect { Aggregate::Stages::Match.new(test: []) }.not_to raise_error
    end
  end
end
