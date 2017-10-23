# frozen_string_literal: true

class RodaApiBoilerplate
  route('users', 'api/v1') do |r|
    r.get do
      params.merge(path: request.path)
    end
  end
end
