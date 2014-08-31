require 'rails_helper'

feature 'User creates multiples todos' do
  let(:list) { FactoryGirl.create(:list) }

  scenario 'Successfully' do
    visit new_list_todo_path(list) 
    expect(page).to have_content("Work list")
    
    click_button "Add todo"
    expect(page).to have_content("Add your todo")
    fill_in 'Description', with: 'Meet up with the team'
    
    click_button 'Add todo'
    expect(page).to have_content('Your new Todo was saved')
    expect(page).to have_content('Meet up with the team')
    
    visit new_list_todo_path(list)
    click_button "Add todo"
    expect(page).to have_content("Add your todo")
    fill_in 'Description', with: 'Debug project'
    
    click_button 'Add todo'
    expect(page).to have_content('Your new Todo was saved')
    expect(page).to have_content('Debug project')
  end
end

#As a user, I should be able to create multiple to-do items on my to-do list.