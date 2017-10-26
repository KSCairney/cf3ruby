FactoryGirl.define do
    sequence(:email) { |n| "user#{n}@example.com" }
    
    factory :user do
        email 
        password "1234567890"
        first_name "Jack"
        last_name "Test"
        admin false
    end
end