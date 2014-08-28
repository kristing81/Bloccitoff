require 'rails_helper'

feature 'Project manager creater TODO' do
  before do
    list = FactoryGirl.create(:list)
  end
  scenario 'Successfully' do
    visit list_path # visit an existing list
    expect(page).to have_content("Work list")
    click_button "Add todo"
    expect(page).to have_content("Add your todo")
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect(page).to have_content('Your new TODO was saved')
    expect(page).to have_content('Meet up with the team')
  end

  scenario 'With description missing' do
    visit new_list_todo_path
    fill_in 'Description', with: ""
    click_button 'Save'
    expect(page).to have_content('There was an error saving your item.  Please try again')
  end
end
#Install