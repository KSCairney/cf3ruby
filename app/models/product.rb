class Product < ApplicationRecord
    def self.search(search_term)
        if Rails.env.development?
            Product.where("name LIKE ?", "%#{search_term}%")
        elsif Rails.env.production?
            Product.where("name ILIKE ?", "%#{search_term}%")
        end
    end
    
    def highest_rating_comment
        Comment.rating_desc.first
    end
    
    def lowest_rating_comment
        Comment.rating_asc.first
    end
    
end
