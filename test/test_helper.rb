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

# Don't really use SOLR in unit tests
Sunspot.session = Sunspot::Rails::StubSessionProxy.new(Sunspot.session)

class ModelTestCase < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ControllerTestCase < ActionController::TestCase
  include Devise::TestHelpers
  include FactoryGirl::Syntax::Methods
end
