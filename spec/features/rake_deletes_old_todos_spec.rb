require 'rails_helper'

describe 'rake delete_todo' do 
  before do
    create(:todo, created_at: 8.days.ago)
  end

  
  it "deletes todos 7 days after creation" do
    Blocitoff::Application.load_tasks
    Rake::Task['delete_todo'].invoke 
    expect(Todo.count).to eq(0)
  end
end


# rake task automatically deletes todos after 7 days

