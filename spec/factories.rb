FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :restaurant do
     name     "gaishi"
    phone     "03-1111-2222"
  address     "tokyo,shinagawa city"
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end
end
