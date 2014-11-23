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
    context 'valid restaurants' do
      it 'prompts user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'Cygnet'
      click_button 'Create Restaurant'
      expect(page).to have_content 'Cygnet'
      expect(current_path).to eq '/restaurants'
      end
    end
end

  context 'invalid restaurants' do
    it 'does not let you submit a name that is too short' do
      visit '/restaurants'
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'PP'
      click_button 'Create Restaurant'
      expect(page).not_to have_css 'h2', text: 'PP'
      expect(page).to have_content 'errors'
    end
  end

context 'editing restaurants' do
    before do
      Restaurant.create(name:'Cygnet')
    end

    it 'lets a user edit a restaurant' do
     visit '/restaurants'
     click_link 'Edit Cygnet'
     fill_in 'Name', with: 'Cygnet'
     click_button 'Update Restaurant'
     expect(page).to have_content 'Cygnet'
     expect(current_path).to eq '/restaurants'
    end
  end

describe 'deleting restaurants' do

  before do
    Restaurant.create(:name => "Cygnet")
  end

  it "removes a restaurant when a user clicks a delete link" do
    visit '/restaurants'
    click_link 'Delete Cygnet'
    expect(page).not_to have_content 'Cygnet'
    expect(page).to have_content 'Restaurant deleted successfully'
  end
end

context 'viewing restaurants' do

  before do
    Restaurant.create(name:'Cygnet', description: "Great Burgers")
  end

  it 'lets a user view a restaurant and its description' do
   visit '/restaurants'
   click_link 'Show Cygnet'
   expect(page).to have_content("Great Burgers")
   expect(current_path).to match(/restaurants\/\d/)
  end

end