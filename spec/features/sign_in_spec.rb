require 'rails_helper'


  scenario 'Successfully sign in' do
    visit user_session_path
    fill_in 'Email', with: 'user.email'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
    expect(current_path).to eq user_session_path
    expect(page).to have_content('Hello #{user.email}!')
    expect(page).to have_content('Signed in successfully')
  end
  scenario 'Successfully sign out' do
    click_button 'Sign out'
    expect(current_path).to eq destroy_user_session_path
    expect(page).to have_content('Signed out successfully')
  end
end

    # before do
    # user = User.new(:email => 'user@example.com', :password => 'password')
    # end
  it 'signs users in' do
    visit user_session_path 
    login_user
    # fill_in 'Email', with: 'user@example.com'
    # fill_in 'Password', with: 'password'
    # click_button 'Sign in'
    expect(page).to have_content('Signed in successfully')
    expect(page).to have_content('Sign out')
  end
  it 'signs users out' do
    login_user
    expect(page).to have_content('Welcome to Blocitoff')

    click_link "Sign out"
    expect(page).to have_content('Signed out successfully')
    expect(page).to have_content('Sign in')
  end
  end



#As a user, I should be able to sign in and out of Blocitoff.

# Visit sign in page
# enter information
# Successfully sign in

# click Sign out
# Successfully sign out
