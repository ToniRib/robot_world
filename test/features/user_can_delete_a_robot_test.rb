require_relative '../test_helper'

class UserCanDeleteARobotTest < FeatureTest
  def test_user_deletes_an_existing_robot
    RobotManager.create({ :name        => 'Frank',
                          :city        => 'Denver',
                          :state       => 'CO',
                          :avatar      => 'https://robohash.org/bluerobot',
                          :birthdate   => '2014-09-18',
                          :hired_on    => '2015-1-10',
                          :department  => 'service'
                        })

    visit '/robots'

    click_button 'delete'

    within '.container' do
      refute page.has_content?('Frank')
    end
  end
end
