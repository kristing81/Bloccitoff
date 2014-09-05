require 'rails_helper'
require 'todo_reaper'

describe TodoReaper do
  describe ".run" do
    before do
      create(:todo, created_at: 8.days.ago)
    end

    it 'deletes all todos older than 7 days' do
      TodoReaper.run
      expect(Todo.count).to eq(0)
    end
  end
end 