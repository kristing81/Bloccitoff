require 'rails_helper'

feature 'New user signs in' do
  scenario 'Successfully' do
    visit user_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign In'
    expect(page).to have_content('Welcome back #{user.name}')
    expect(page).to have_content('Welcome to Bloccitoff')
  end
end