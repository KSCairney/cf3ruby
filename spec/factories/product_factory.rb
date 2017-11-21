FactoryGirl.define do

  factory :comment do
    user_id 1
    body "This is a test, rspect"
    rating 4
  end

  factory :product do
    name "Rspec factory bike"
    description "This is not a real bike"
    image_url "http://sweetclipart.com/multisite/sweetclipart/files/bike_blue.png"
    colour "silver"
    price "4.99"
  end

end