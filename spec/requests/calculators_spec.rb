require 'rails_helper'

RSpec.describe "Calculators", type: :request do
  describe "POST /create" do

    context "with single number parameters" do
      let(:string_number_params) { { string_numbers: "1"} }
      it "add number" do
        post "/calculators", params: string_number_params
        expect JSON(response.body)["response"] == 1
      end

      it "returns a success response" do
        post "/calculators", params: string_number_params
        expect(response).to have_http_status(:ok)
      end
    end

    context "with valid parameters" do
      let(:string_number_params) { { string_numbers: "1,2"} }
      it "add number" do
        post "/calculators", params: string_number_params
        expect JSON(response.body)["response"] == 3
      end

      it "returns a success response" do
        post "/calculators", params: string_number_params
        expect(response).to have_http_status(:ok)
      end
    end

    context "with blank parameters" do
      let(:string_number_params) { { string_numbers: " "} }
      it "add number" do
        post "/calculators", params: string_number_params
        expect JSON(response.body)["response"] == 0
      end

      it "returns a success response" do
        post "/calculators", params: string_number_params
        expect(response).to have_http_status(:ok)
      end
    end

    context "with negative parameters" do
      let(:string_number_params) { { string_numbers: "-1,-2"} }

      it "add negative number" do
        post "/calculators", params: string_number_params
        expect JSON(response.body)["status"] == false
      end

      it "returns an error response" do
        post "/calculators", params: string_number_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end


