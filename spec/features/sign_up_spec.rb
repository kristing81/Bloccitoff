require 'rails_helper'

feature 'New user signs up' do
  scenario 'Successfully' do
    visit new_user_registration_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password', match: :prefer_exact
    click_button 'Sign up'
    expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please open the link to activate your account.')
    expect(page).to have_content('Welcome to Bloccitoff')
  end
end