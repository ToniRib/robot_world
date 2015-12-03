ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'

class Minitest::Test
  def teardown
    RobotManager.delete_all
  end
end

Capybara.app = RobotManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
