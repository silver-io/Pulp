require 'rails_helper'

describe 'restaurants' do
  context 'no restaurants yet' do
      it 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'Cygnet')
    end

    it 'should display restaurants' do
      visit '/restaurants'
      expect(page).to have_content('Cygnet')
      expect(page).not_to have_content('No restaurants')
    end
  end
end

describe 'creating restaurants' do
 it 'prompts user to fill out a form, then displays the new restaurant' do
  visit '/restaurants'
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'Cygnet'
  click_button 'Create Restaurant'
  expect(page).to have_content 'Cygnet'
  expect(current_path).to eq '/restaurants'
 end
end