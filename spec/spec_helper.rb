RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def sign_up(username)
    visit new_user_url
    fill_in 'username', with: username
    fill_in 'password', with: 'password'
    click_on 'Submit'
  end

  def sign_in(username)
    visit new_session_url
    fill_in 'username', with: username
    fill_in 'password', with: 'password'
    click_on 'Submit'
  end

end
