require 'rails_helper'

describe Product do
    context "product has more than one review" do
        let(:product) { Product.create!(name: "race bike") }
        let(:user) { User.create!(email: "user@test.com", password: "testing") }
        before do
            product.comments.create!(rating: 1, user: user, body: "Awful Bike!")
            product.comments.create!(rating: 3, user: user, body: "OK Bike!")
            product.comments.create!(rating: 5, user: user, body: "More tea Mr. Bike?")
        end
        it "returns the average rating of all comments" do
            expect(Product.new(description: "Nice bike")).not_to be_valid
        end
    end
end