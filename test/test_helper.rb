require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ModelTestCase < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ControllerTestCase < ActionController::TestCase
  include Devise::TestHelpers
  include FactoryGirl::Syntax::Methods
end
