# frozen_string_literal: true

module RequestSpecHelpers
  def response
    last_response
  end

  def json(str)
    JSON.parse(str)
  end
end
