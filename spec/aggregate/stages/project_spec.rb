# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Stages::Project do
  describe "#transpose" do
    it "should properly format simple projections" do
      expect(Aggregate::Stages::Project.new(test: 1).transpose).to eq('$project': { 'test': 1 })
    end

    it "should properly format complex projections" do
      expect(Aggregate::Stages::Project.new(test: { me: 1 }).transpose).to eq('$project': { 'test': { 'me': 1 } })
    end
  end
end
