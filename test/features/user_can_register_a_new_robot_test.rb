require_relative '../test_helper'

class UserCanRegisterANewRobotTest < FeatureTest
  def test_user_registers_a_new_robot_with_correct_attributes
    skip
    visit '/robots/new'

    fill_in 'robot[name]', with: 'Frank'
    fill_in 'robot[city]', with: 'Denver'
    fill_in 'robot[state]', with: 'CO'
    fill_in 'robot[avatar]', with: 'https://robohash.org/bluerobot'
    fill_in 'robot[birthdate]', with: '2014-09-18'
    fill_in 'robot[hired_on]', with: '2015-1-10'
    choose 'Service'

    click_button 'Submit'

    assert_equal '/robots', current_path

    within '.card' do
      assert page.has_content?('Frank')
    end
  end
end
