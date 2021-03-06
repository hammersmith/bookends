if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'mocha/mini_test'
require 'sunspot_matchers/test_helper'
require 'webmock/minitest'

WebMock.disable_net_connect!(allow: %w{codeclimate.com})

# Don't really use SOLR in unit tests
Sunspot.session = SunspotMatchers::SunspotSessionSpy.new(Sunspot.session)

class UnitTestCase < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  include SunspotMatchers::TestHelper
end

class ControllerTestCase < ActionController::TestCase
  include Devise::TestHelpers
  include FactoryGirl::Syntax::Methods
  include SunspotMatchers::TestHelper
end
