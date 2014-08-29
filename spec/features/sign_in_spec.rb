require 'rails_helper'

feature 'Sign in and out' do
  scenario 'Successfully sign in' do
    visit user_session_path
    login_user
    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Hello user@example.com!')
  end
  scenario 'Successfully sign out' do
    login_user
    expect(page).to have_content('Welcome to Bloccitoff')
    click_link 'Sign out'
    expect(current_path).to eq '/'
    expect(page).to have_content('Signed out successfully')
  end
end


#As a user, I should be able to sign in and out of Blocitoff.

# Visit sign in page
# enter information
# Successfully sign in

# click Sign out
# Successfully sign out
