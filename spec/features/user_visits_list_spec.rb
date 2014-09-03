require 'rails_helper'

feature 'User visits a list' do 
  let(:list) { FactoryGirl.create(:list) }

  scenario 'Successfully sees todo visit' do
    visit list_path(list)
    expect(page).to have_content("Work list")
    expect(page).to have_content("Meet with team")
  end
end