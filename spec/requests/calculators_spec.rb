require 'rails_helper'

RSpec.describe "Calculators", type: :request do
  describe "POST /create" do

    context "with single number parameters" do
      let(:string_number_params) { { string_numbers: "1"} }
      it "add number" do
        post "/calculators", params: string_number_params
        total = JSON(response.body)["response"]
        expect(total).to eq(1)
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
        total = JSON(response.body)["response"]
        expect(total).to eq(3)
      end

      it "returns a success response" do
        post "/calculators", params: string_number_params
        expect(response).to have_http_status(:ok)
      end
    end

    context "with valid multiple digit parameters" do
      let(:string_number_params) { { string_numbers: "10,20"} }
      it "add multiple digit number" do
        post "/calculators", params: string_number_params
        total = JSON(response.body)["response"]
        expect(total).to eq(30)
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
        total =  JSON(response.body)["response"]
        expect(total).to eq(0)
      end

      it "returns a success response" do
        post "/calculators", params: string_number_params
        expect(response).to have_http_status(:ok)
      end
    end

    context "add new line string" do
      let(:string_number_params) { { string_numbers: "\n"} }
      it "add new line" do
        post "/calculators", params: string_number_params
        total = JSON(response.body)["response"]
        expect(total).to eq(0)
      end

      it "returns a success response" do
        post "/calculators", params: string_number_params
        expect(response).to have_http_status(:ok)
      end
    end

    context "add new line between number" do
      let(:string_number_params) { { string_numbers: "1\n2"} }
      it "add new line between two number" do
        post "/calculators", params: string_number_params
        total = JSON(response.body)["response"]
        expect(total).to eq(3)
      end

      it "returns a success response" do
        post "/calculators", params: string_number_params
        expect(response).to have_http_status(:ok)
      end
    end

    context "add multiple delimiter" do
      let(:string_number_params) { { string_numbers: "//;\n1;2"} }
      it "add multiple delimiter number" do
        post "/calculators", params: string_number_params
        total = JSON(response.body)["response"]
        expect(total).to eq(3)
      end

      it "returns a success response" do
        post "/calculators", params: string_number_params
        expect(response).to have_http_status(:ok)
      end
    end

    context "with delimiter and negative and positive parameters" do
      let(:string_number_params) { { string_numbers: "//;\n-1;2"} }

      it "add negative and positive number" do
        post "/calculators", params: string_number_params
        total = JSON(response.body)["response"]
        expect(total).to eq(1)
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

    context "with delimiter and negative parameters" do
      let(:string_number_params) { { string_numbers: "//;\n-1;-2"} }

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


