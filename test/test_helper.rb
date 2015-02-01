ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  
end

class ControllerTestCase < ActionController::TestCase
  include Devise::TestHelpers
  include FactoryGirl::Syntax::Methods
end
