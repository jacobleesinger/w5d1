require 'spec_helper'
require 'rails_helper'

feature 'testing goals' do
  before :each do
    sign_up('Breakfast')
  end

  feature 'create goals' do
    before(:each) do
      click_on 'Create New Goal'
    end

    scenario "shows goal form" do
      expect(page).to have_content "Create New Goal"
    end

    before(:each) do
      visit new_goal_url
      fill_in "title", with: 'Coding'
      fill_in "description", with: 'Python'
      choose('Private')
      click_on "Submit"
    end

    scenario "creates goal with title" do
      expect(page).to have_content "Coding"
    end

    scenario "creates goal with description" do
      expect(page).to have_content "Python"
    end

    # scenario "visible only to creator" do
    #   expect(page).to have_content "Coding"
    # end
  end

  feature 'update goals' do

  end

  feature 'delete goals' do

  end
end
