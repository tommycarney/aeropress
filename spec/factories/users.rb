FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@test.com"
  end
  factory :user do
    email                 { generate :email }
    password              "asdfasdf"
    password_confirmation "asdfasdf"
  end
end
