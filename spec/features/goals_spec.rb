require 'spec_helper'
require 'rails_helper'

feature 'testing goals' do
  before :each do
    sign_up('Breakfast')
  end

  scenario "shows goal form" do
    expect(page).to have_content "Create New Goal"
  end

  feature 'create goals' do
    before(:each) do
      click_on 'Create New Goal'
    end

    before(:each) do
      create_goal('testing goal')
    end

    scenario "creates goal with title" do
      expect(page).to have_content "testing goal"
    end

    scenario "creates goal with description" do
      expect(page).to have_content "blah blah blah"
    end

  end

  feature 'user has goals' do
    user = FactoryGirl.build(:user)
    user.id = 1

    before(:each) do
      sign_up(user)
      goal = FactoryGirl.build(:public_goal)
      user.goals = [goal]
    end

    scenario "user has a goal" do
      expect(user.goals.first).to be_instance_of(Goal)
    end

    scenario "user has multiple goals" do
      user.goals << FactoryGirl.build(:public_goal)
      expect(user.goals.length).to eq(2)
    end
  end

  feature 'update goals' do
    before(:each) do
      create_goal('fml')
      click_on "Edit Goal"
      fill_in 'title', with: 'better goal'
      click_on "Submit"
    end

    scenario "user update goal title" do
      expect(page).to have_content 'better goal'
    end
  end

  feature 'delete goals' do

  end
end
