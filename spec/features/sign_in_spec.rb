require 'rails_helper'

feature 'User signs in and out' do
   before :each do
    User.new(:email => 'user@example.com', :password => 'password')
  end
  
  it 'signs users in' do
    visit user_session_path
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully')
  end
    it 'signs users out' do
      click_button 'Sign out'
      expect(current_path).to eq destroy_user_session_path
      expect(page).to have_content('Signed out successfully')
    end
  end



#As a user, I should be able to sign in and out of Blocitoff.

# Visit sign in page
# enter information
# Successfully sign in
# click Sign out
# Successfully sign out
