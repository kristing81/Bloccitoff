require 'rails_helper'

feature 'User marks todo as complete' do 
  let(:list) { FactoryGirl.create(:list) }
  let(:todo) { list.todos.first }

  scenario 'Successfully complete todo' do
    visit list_path(list, todo)
    expect(todo.completed_at).to eq nil
    click_link('Complete')
    expect(page).to have_content("Todo is complete")
    expect(page).to_not have_content(todo.description)
  end
end

# user visits existing todo list
# user selects check box 'complete'
# todo is shown as complete

     