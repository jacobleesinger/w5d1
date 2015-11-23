require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  user = FactoryGirl.build(:user)
  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Create User"
  end

  feature "signing up a user" do
    fill_in 'username', with: user.username
    fill_in 'password', with: user.password
    click_on 'Submit'
    scenario "shows username on the homepage after signup" do
      expect(page).to have_content user.username
    end
  end
end

# feature "logging in" do
#   user = FactoryGirl.build(:user)
#   visit new_session_url
#   fill_in 'username', with: user.username
#   fill_in 'password', with: user.password
#   click_on 'Submit'
#   scenario "shows username on the homepage after login"
#     expect(page).to have_content user.username
#   end
# end
#
# feature "logging out" do
#
#   it "begins with logged out state"
#
#   it "doesn't show username on the homepage after logout"
#
# end
