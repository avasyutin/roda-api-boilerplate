# frozen_string_literal: true

class RodaApiBoilerplate
  route('users', 'api/v1') do |r|
    r.get do
      User.all.to_json
    end
  end
end
