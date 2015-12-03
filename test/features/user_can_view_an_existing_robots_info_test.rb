require_relative '../test_helper'

class UserCanViewAnExistingRobotsInfoTest < FeatureTest
  def test_user_sees_robots_current_information
    RobotManager.create({ :name        => 'Frank',
                          :city        => 'Denver',
                          :state       => 'CO',
                          :avatar      => 'https://robohash.org/bluerobot',
                          :birthdate   => '2014-09-18',
                          :hired_on    => '2015-1-10',
                          :department  => 'service'
                        })

    visit "/robots/#{RobotManager.all.last.id}"

    within 'header' do
      assert page.has_content?('Frank')
    end

    within '#robot-info' do
      assert page.has_content?('Denver')
      assert page.has_content?('CO')
      assert page.has_content?('2014-09-18')
      assert page.has_content?('2015-1-10')
      assert page.has_content?('service')
    end

    within '#robot-img' do
      assert page.has_css?("img[src$='https://robohash.org/bluerobot']")
    end
  end
end
