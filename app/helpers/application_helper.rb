module ApplicationHelper
  ERROR_MSG = "negatives not allowed"
  SUCCESS_MSG = "Result successfully"

  def json_response(status,value)
    case status
    when true
      render json: { message: SUCCESS_MSG, response: value }, status: :ok
    else
      render json: { status: status,message: ERROR_MSG }, status: :unprocessable_entity
    end
  end
end
