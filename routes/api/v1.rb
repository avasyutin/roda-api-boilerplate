# frozen_string_literal: true

class RodaApiBoilerplate
  route('v1', 'api') do |r|
    r.multi_route('api/v1')
  end
end
