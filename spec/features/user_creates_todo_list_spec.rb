require 'rails_helper'

feature 'User creates todo list' do
  scenario 'Successfully creates list' do
    visit new_list_path
    fill_in 'List name', with: "This week"
    click_button 'Save'
    expect(page).to have_content('This week')
  end
end
   




# As a user, I should be able to create a single to-do list.
# user
# User creates Todo
# User sees days left to complete todo
# user has ability to complete todo. boolean