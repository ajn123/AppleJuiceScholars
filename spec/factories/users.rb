FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "emailNum1#{n}@email.com" }
    password "password"
  end

end
