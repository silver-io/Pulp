require 'rails_helper'

describe 'reviewing' do
    before do
        Restaurant.create(name: 'Cygnet')
    end

    def leave_review(thoughts, rating)
        visit '/restaurants'
        click_link 'Review Cygnet'
        fill_in "Thoughts", with: thoughts
        select rating, from:'Rating'
        click_button 'Leave Review'
    end


    it 'allows users to leave reviews using the form that appears alongside the restaurants' do
        leave_review("terrible", "1")
        expect(current_path).to eq '/restaurants'
        expect(page).to have_content 'terrible'
    end

    it 'displays an average rating for all reviews' do

    end

end

