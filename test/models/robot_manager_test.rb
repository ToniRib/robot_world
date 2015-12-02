require_relative '../test_helper'
require 'pry'

class RobotManagerTest < Minitest::Test
  def test_it_creates_a_robot
    RobotManager.create({ 'id'         => 1,
                          :name        => 'Frank',
                          :city        => 'Denver',
                          :state       => 'CO',
                          :avatar      => 'https://robohash.org/bluerobot',
                          :birthdate   => '2014-09-18',
                          :hired_on    => '2015-1-10',
                          :department  => 'service'
                        })

    robot = RobotManager.find(1)

    assert_equal 1, robot.id
    assert_equal 'Frank', robot.name
    assert_equal 'Denver', robot.city
    assert_equal 'CO', robot.state
    assert_equal 'https://robohash.org/bluerobot', robot.avatar
    assert_equal '2014-09-18', robot.birthdate
    assert_equal '2015-1-10', robot.hired_on
    assert_equal 'service', robot.department
  end
end
