# frozen_string_literal: true

require_relative 'db'

Sequel::Model.cache_associations = false if RodaApiBoilerplate.development?
Sequel::Model.plugin(:json_serializer)

Unreloader.require('models')
