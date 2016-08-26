require 'rails_helper'

feature 'loos' do
  context 'User lands on homepage' do
    it 'should display a button to upload a loo with a view' do
      visit '/loos'
      expect(page).to have_link 'Upload a loo with a view'
    end
  end
end
