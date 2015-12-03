require_relative '../test_helper'
require 'pry'

class RobotManagerTest < Minitest::Test
  def create_three_robots
    robots = [{ 'id'         => 1,
                :name        => 'Robot1',
                :city        => 'City1',
                :state       => 'State1',
                :avatar      => 'https://robohash.org/robot1',
                :birthdate   => '2014-09-1',
                :hired_on    => '2015-1-1',
                :department  => 'service'
              },
              { 'id'         => 2,
                :name        => 'Robot2',
                :city        => 'City2',
                :state       => 'State2',
                :avatar      => 'https://robohash.org/robot2',
                :birthdate   => '2014-09-2',
                :hired_on    => '2015-1-2',
                :department  => 'transportation'
              },
              { 'id'         => 3,
                :name        => 'Robot3',
                :city        => 'City3',
                :state       => 'State3',
                :avatar      => 'https://robohash.org/robot3',
                :birthdate   => '2014-09-3',
                :hired_on    => '2015-1-3',
                :department  => 'service'
              }
    ]

    robots.each { |robot| RobotManager.create(robot) }
  end

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

  def test_it_finds_all_robots_in_database
    create_three_robots

    assert_equal 3, RobotManager.all.count

    i = 1
    RobotManager.all.each do |robot|
      assert_equal Robot, robot.class
      assert_equal i, robot.id
      assert_equal "Robot#{i}", robot.name
      assert_equal "City#{i}", robot.city
      assert_equal "State#{i}", robot.state
      assert_equal "https://robohash.org/robot#{i}", robot.avatar
      assert_equal "2014-09-#{i}", robot.birthdate
      assert_equal "2015-1-#{i}", robot.hired_on
      if i != 2
        assert_equal 'service', robot.department
      else
        assert_equal 'transportation', robot.department
      end

      i += 1
    end
  end

  def test_it_finds_a_specific_robot
    create_three_robots

    robot = RobotManager.find(2)

    assert_equal 2, robot.id
    assert_equal 'Robot2', robot.name
    assert_equal 'City2', robot.city
    assert_equal 'State2', robot.state
    assert_equal 'https://robohash.org/robot2', robot.avatar
    assert_equal '2014-09-2', robot.birthdate
    assert_equal '2015-1-2', robot.hired_on
    assert_equal 'transportation', robot.department
  end

  def test_it_updates_a_specific_robot
    create_three_robots

    new_data = { :name        => 'Robot2_v2',
                 :city        => 'City2_v2',
                 :state       => 'State2_v2',
                 :avatar      => 'https://robohash.org/robot2_v2',
                 :birthdate   => '2014-09-20',
                 :hired_on    => '2015-1-20',
                 :department  => 'service'
    }
    RobotManager.update(2, new_data)

    robot = RobotManager.find(2)

    assert_equal 2, robot.id
    assert_equal 'Robot2_v2', robot.name
    assert_equal 'City2_v2', robot.city
    assert_equal 'State2_v2', robot.state
    assert_equal 'https://robohash.org/robot2_v2', robot.avatar
    assert_equal '2014-09-20', robot.birthdate
    assert_equal '2015-1-20', robot.hired_on
    assert_equal 'service', robot.department
  end

  def test_it_deletes_a_robot
    create_three_robots

    assert_equal 3, RobotManager.all.count

    RobotManager.delete(2)

    assert_equal 2, RobotManager.all.count
  end
end
