class CalculatorsController < ApplicationController
  before_action :validate_params
  def create
    validate_total_sum
  end

  private

    def validate_params
      if params[:string_numbers].blank?
        json_response(true,0)
      else params[:string_numbers].present?
        params[:string_numbers] = params[:string_numbers].gsub(/[^\d,-]+/, ',').split(',').reject(&:empty?);
      end
    end

    def validate_total_sum
      total = params[:string_numbers].map(&:to_i).sum
      if total > 0
        json_response(true,total)
      else
        negative_number = params[:string_numbers].map{|n| n if n.to_i < 0}.compact.join(',')
        json_response(false,negative_number)
      end
    end
end
