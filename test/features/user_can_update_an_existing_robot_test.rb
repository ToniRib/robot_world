require_relative '../test_helper'

class UserCanRegisterANewRobotTest < FeatureTest
  def test_user_registers_a_new_robot_with_correct_attributes
    skip
    RobotManager.create({ 'id'         => 1,
                          :name        => 'Frank',
                          :city        => 'Denver',
                          :state       => 'CO',
                          :avatar      => 'https://robohash.org/bluerobot',
                          :birthdate   => '2014-09-18',
                          :hired_on    => '2015-1-10',
                          :department  => 'service'
                        })

    visit '/robots/1/edit'

    fill_in 'robot[name]', with: 'Frank_v2'

    click_button 'Submit'

    assert_equal '/robots/1', current_path

    within 'h1' do
      assert page.has_content?('Frank_v2')
    end
  end
end
