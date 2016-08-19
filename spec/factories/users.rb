FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "emailnum#{n}@email.com" }
    password "password"
  end

end
