# frozen_string_literal: true

require_relative './boot'

run(RodaApiBoilerplate.development? ? Unreloader : RodaApiBoilerplate.freeze.app)
