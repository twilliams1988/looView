require 'rails_helper'

feature 'comments' do

  before { Loo.create(title: 'Elbrus') }

  context 'other users can comment on looViews' do
    it 'should allow users to fill in a form with comments' do
      visit '/loos'
      click_link 'Comment'
      fill_in "Comments", with: "Awesome photo!"
      click_button "Comment"
      expect(page).to have_content "Awesome photo!"
    end
  end
end
