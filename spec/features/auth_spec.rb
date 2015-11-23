require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  # user = FactoryGirl.build(:user)
  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Create User"
  end

  feature "signing up a user" do
    before(:each) do
      sign_up('Breakfast')
    end
    scenario "shows username on the homepage after signup" do
      expect(page).to have_content 'Breakfast'
    end
  end
end

feature "logging in" do
  user = FactoryGirl.build(:user)
  before(:each) do
    sign_up('Breakfast')
    sign_in('Breakfast')
  end
  scenario "shows username on the homepage after login" do
    expect(page).to have_content user.username
  end
end

feature "logging out" do
  scenario "begins with logged out state" do
    visit root_url
    expect(page).to have_content 'Sign In'
    expect(page).to have_content 'Sign Up'
  end
  scenario "doesn't show username on the homepage after logout" do
    sign_up('Breakfast')
    click_on 'Sign Out'
    expect(page).to have_content 'Sign In'
  end

end
