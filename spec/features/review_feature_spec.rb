require 'rails_helper'

describe 'reviewing' do
    before do
        Restaurant.create(name: 'Cygnet')
    end

    it 'allows users to leave reviews using the form that appears alongside the restaurants' do
        visit '/restaurants'
        click_link 'Review Cygnet'
        fill_in "Thoughts", with: "ok"
        select '3', from:'Rating'
        click_button 'Leave Review'
        expect(current_path).to eq '/restaurants'
        expect(page).to have_content 'ok'
    end
end

