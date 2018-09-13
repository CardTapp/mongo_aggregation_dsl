# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Contracts::ClassIncludes do
  describe "#valid?" do
    it "is true if the class includes the given module" do
      contract = Aggregate::Contracts::ClassIncludes.new(Document)
      expect(contract.valid?(Mongoid::Document)).to eq true
    end
    it "is false if the class excludes the given module" do
      contract = Aggregate::Contracts::ClassIncludes.new(Integer)
      expect(contract.valid?(Mongoid::Document)).to eq false
    end
  end
end
