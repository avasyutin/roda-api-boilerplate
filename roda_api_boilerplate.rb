# frozen_string_literal: true

class RodaApiBoilerplate < Roda
  plugin :environments
  plugin :multi_route
  plugin :indifferent_params
  plugin :json

  Unreloader.require('./routes') {}

  route do |r|
    response['Content-Type'] = 'application/json'

    r.multi_route

    r.root do
      'It works!'
    end
  end

  def self.root
    Pathname.new(File.expand_path('..', __FILE__))
  end
end
