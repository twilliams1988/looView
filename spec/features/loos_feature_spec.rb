require 'rails_helper'

feature 'loos' do
  context 'User lands on homepage' do
    it 'should display a button to upload a loo with a view' do
      visit '/loos'
      expect(page).to have_link 'Upload a loo with a view'
    end
  end

  context 'creating loos' do
    it 'user fills out the form and displays home page' do
      visit '/loos'
      click_link 'Upload a loo with a view'
      fill_in 'Title', with: 'Mount Elbrus Portaloo'
      click_button 'Create Loo'
      expect(page).to have_content 'Mount Elbrus Portaloo'
      expect(current_path).to eq '/loos'
    end
  end

  context 'viewing loos' do
    let!(:elbrus){ Loo.create(title: "Elbrus")}
    it 'lets a user click a loo to view it' do
      visit '/loos'
      click_link 'Elbrus'
      expect(page).to have_content 'Elbrus'
      expect(current_path).to eq "/loos/#{elbrus.id}"
    end
  end

  context 'editing/deleting loos' do
    before { @loo = Loo.create(title: "Elbrus") }
    it 'lets a user edit a loo' do
      visit "/loos/#{@loo.id}"
      click_link 'Edit Elbrus'
      fill_in 'Title', with: 'Mount Elbrus Portaloo'
      click_button 'Update Loo'
      expect(page).to have_content 'Mount Elbrus Portaloo'
      expect(current_path).to eq "/loos/#{@loo.id}"
    end
    it 'user can delete a view' do
      visit "/loos/#{@loo.id}"
      click_link 'Delete Elbrus'
      expect(page).not_to have_content 'Elbrus'
      expect(page).to have_content 'Loo Deleted Successfully'
      expect(current_path).to eq '/loos'
    end
  end
end
