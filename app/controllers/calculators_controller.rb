class CalculatorsController < ApplicationController
  before_action :validate_params
  def create
    validate_total_sum
  end

  private

    def validate_params
      if params[:string_numbers].blank?
        render json: { message: "Result successfully", response: 0 }, status: :ok
      # elsif params[:string_number].include?("-")
      #   render json: { message: "negatives not allowed" }, status: :unprocessable_entity
      else params[:string_numbers].present?
        params[:string_numbers] = params[:string_numbers].gsub(/[^\d,-]+/, ',').split(',').reject(&:empty?);
      end
    end

    def validate_total_sum
      total = params[:string_numbers].map(&:to_i).sum
      if total > 0
        render json: { status: true , message: "Result successfully",response:  total}, status: :ok
      else
        render json: { message: "negatives not allowed" }, status: :unprocessable_entity
      end
    end
end
