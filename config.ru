# frozen_string_literal: true

require_relative './config/boot'

run(RodaApiBoilerplate.development? ? Unreloader : RodaApiBoilerplate.freeze.app)
