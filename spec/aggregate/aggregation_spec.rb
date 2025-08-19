# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Pipeline do
	before do
		allow(TestDocument).to receive(:collection).and_return(double)
	end

	it "raises if klass is not a mongoid document and collection does not exist" do
		expect{Aggregate::Pipeline.new(Object)}.to raise_error
	end	

	it "does not raise if klass is a mongoid document" do
		expect{Aggregate::Pipeline.new(TestDocument)}.not_to raise_error
	end

	it "does not raise if string excists as a collection" do
		collections = [double(name: "should_exist", present?: true)]
        allow(Mongoid).to receive_message_chain(:default_client, :collections).and_return(collections)
		expect{Aggregate::Pipeline.new("should_exist")}.not_to raise_error
  end

  describe "#primary_read" do
    it "sets the read preference" do
      pipeline = Aggregate::Pipeline.new(TestDocument)
      expect(pipeline.primary_read).to be false
      expect(pipeline.with_primary_read).to eq pipeline
      expect(pipeline.primary_read).to be true
    end
  end

end
