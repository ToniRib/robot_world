require_relative '../test_helper'

class UserSeesAllRobotsTest < FeatureTest
  def test_user_sees_index_of_robots
    RobotManager.create({ :name        => 'Frank',
                          :city        => 'Denver',
                          :state       => 'CO',
                          :avatar      => 'https://robohash.org/bluerobot',
                          :birthdate   => '2014-09-18',
                          :hired_on    => '2015-1-10',
                          :department  => 'service'
                        })

    visit '/robots'

    within '.card' do
      assert page.has_content?('Frank')
    end
  end
end
