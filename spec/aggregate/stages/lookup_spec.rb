# frozen_string_literal: true

require "rails_helper"

RSpec.describe Aggregate::Stages::Lookup do
  before do |example|
    allow(TestDocument).to receive(:collection).and_return(double)
  end

  describe "#transpose" do
    it "should properly format" do
      expect(Aggregate::Stages::Lookup.new(from:     TestDocument,
                                           let:      { test: :"$_id" },
                                           as:       "test",
                                           pipeline: Aggregate::Pipeline.new(TestDocument)).transpose).
          to eq('$lookup': { 'from': "test_documents", 'let': { 'test': "$_id" }, 'as': "test", 'pipeline': [] })
    end
  end

  describe "schema" do
    context "simple" do
      it "does not raise if from is valid Mongoid Document" do
        expect do
          Aggregate::Stages::Lookup.new(from:         TestDocument,
                                        localField:   "_id",
                                        foreignField: "_foreign_id",
                                        as:           "test")
        end.not_to raise_error
      end

      it "does not raise if from string exists as a collection" do
        expect do
          collections = [double(name: "should_exist", present?: true)]
          allow(Mongoid).to receive_message_chain(:default_client, :collections).and_return(collections)
          Aggregate::Stages::Lookup.new(from:         "should_exist",
                                        localField:   "_id",
                                        foreignField: "_foreign_id",
                                        as:           "test")
        end.not_to raise_error
      end

      describe "from" do
        it "raises if value is not a Class and the collection does not exist" do
          expect do
            collections = [double(name: "should_exist", present?: true)]
            allow(Mongoid).to receive_message_chain(:default_client, :collections).and_return(collections)
            Aggregate::Stages::Lookup.new(from:         "should_not_exist",
                                          localField:   "_id",
                                          foreignField: "_foreign_id",
                                          as:           "test")
          end.to raise_error(ParamContractError)
        end
      end

      describe "localField" do
        it "raises if value is not a string" do
          expect do
            Aggregate::Stages::Lookup.new(from:         TestDocument,
                                          localField:   1,
                                          foreignField: "_foreign_id",
                                          as:           1)
          end.to raise_error(ParamContractError)
        end
      end

      describe "foreignField" do
        it "raises if value is not a string" do
          expect do
            Aggregate::Stages::Lookup.new(from:         TestDocument,
                                          localField:   "_id",
                                          foreignField: 1,
                                          as:           1)
          end.to raise_error(ParamContractError)
        end
      end

      describe "as" do
        it "raises if value is not a string" do
          expect do
            Aggregate::Stages::Lookup.new(from:         TestDocument,
                                          localField:   "_id",
                                          foreignField: "_foreign_id",
                                          as:           1)
          end.to raise_error(ParamContractError)
        end
      end
    end

    context "pipeline" do
      it "does not raise if hash is valid" do
        expect do
          Aggregate::Stages::Lookup.new(from:     TestDocument,
                                        let:      { test: :test },
                                        as:       "test",
                                        pipeline: Aggregate::Pipeline.new(TestDocument))
        end.not_to raise_error
      end

      describe "from" do
        it "raises if value is not a Class and the collection does not exist" do
          collections = [double(name: "should_exist", present?: true)]
          allow(Mongoid).to receive_message_chain(:default_client, :collections).and_return(collections)
          expect do
            Aggregate::Stages::Lookup.new(from:     "should_not_exist",
                                          let:      { test: :test },
                                          as:       "test",
                                          pipeline: Aggregate::Pipeline.new(TestDocument))
          end.to raise_error(ParamContractError)
        end

        it "raises if value is not a Mongoid Document and the collection does not exist" do
          collections = [double(name: "should_exist", present?: true)]
          allow(Mongoid).to receive_message_chain(:default_client, :collections).and_return(collections)
          expect do
            Aggregate::Stages::Lookup.new(from:     Object,
                                          let:      { test: :test },
                                          as:       "test",
                                          pipeline: Aggregate::Pipeline.new(TestDocument))
          end.to raise_error(ParamContractError)
        end
      end

      describe "let" do
        it "raises if value is not a hash" do
          expect do
            Aggregate::Stages::Lookup.new(from:     TestDocument,
                                          let:      "",
                                          as:       "test",
                                          pipeline: Aggregate::Pipeline.new(TestDocument))
          end.to raise_error(ParamContractError)
        end

        it "raises if hash is empty" do
          expect do
            Aggregate::Stages::Lookup.new(from:     TestDocument,
                                          let:      {},
                                          as:       "test",
                                          pipeline: Aggregate::Pipeline.new(TestDocument))
          end.to raise_error(ParamContractError)
        end

        it "raises if hash values are not a symbol" do
          expect do
            Aggregate::Stages::Lookup.new(from:     TestDocument,
                                          let:      { test: "" },
                                          as:       "test",
                                          pipeline: Aggregate::Pipeline.new(TestDocument))
          end.to raise_error(ParamContractError)
        end
      end

      describe "as" do
        it "raises if value is not a string" do
          expect do
            Aggregate::Stages::Lookup.new(from:     TestDocument,
                                          let:      { test: :test },
                                          as:       1,
                                          pipeline: Aggregate::Pipeline.new(TestDocument))
          end.to raise_error(ParamContractError)
        end
      end

      describe "pipeline" do
        it "raises if value is not a pipeline" do
          expect do
            Aggregate::Stages::Lookup.new(from:     TestDocument,
                                          let:      { test: :test },
                                          as:       "test",
                                          pipeline: "")
          end.to raise_error(ParamContractError)
        end
      end
    end
  end
end
