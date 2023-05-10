module Requests
  module JsonHelpers
    def response_body
      JSON.parse(response.body)
    end
  end
end