require 'rails_helper'

RSpec.describe Review, :type => :model do
	 it "is invalid if the rating is less than 1" do
	    review = Review.new(rating: -1)
	    expect(review).to have(1).error_on(:rating)
	    expect(review).not_to be_valid
	 end


	 it "is invalid if the rating is more than 5" do
	 	review = Review.new(rating: 10)
	 	expect(review).to have(1).error_on(:rating)
	 	expect(review).not_to be_valid

	 end

	 it "is valid if the rating is between 1 and 5" do
	    review = Review.new(rating: 4)
	    expect(review).to be_valid
	 end

end
