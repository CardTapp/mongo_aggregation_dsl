# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Values::DocumentClass do
  describe "#transpose" do
    it "raises if is_key is true" do
      expect { Aggregate::Values::DocumentClass.new([]).to_s }.to raise_error(ArgumentError)
    end

    it "properly formats an array" do
      expect(Aggregate::Values::DocumentClass.new(TestDocument, false).to_s).to eq "test_documents"
    end
  end

  describe "#handles" do
    it "returns true for Mongoid Documents" do
      expect(Aggregate::Values::DocumentClass.handles?(TestDocument)).to eq true
    end

    it "returns false for non Mongoid Documents" do
      expect(Aggregate::Values::DocumentClass.handles?(1)).to eq false
    end
  end
end
