FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :restaurant do
     name     "gaishi"
    phone     "03-1111-2222"
  address     "tokyo,shinagawa city"
  end
end
