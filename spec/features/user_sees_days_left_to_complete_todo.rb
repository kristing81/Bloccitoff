require 'rails_helper'

feature 'User sees days left to complete todo' do 
  let(:list) { FactoryGirl.create(:list) }
  let(:todo) { list.todos.first }

  scenario 'See days left on todo' do
     visit list_path(list, todo)
     expect(page).to have_content('Meet with team')
     expect(page).to have_content('7 days')
  end
end



# User visits todo list
# User creates a todo
# User sees that there are 7 days left to complete that todo
#As a user, I should be able to see how many days are left before a to-do item is automatically deleted.