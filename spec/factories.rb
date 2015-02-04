FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) {|n| "person#{n}@example.com" }
    password  "123456"
    password_confirmation "123456"
    
     factory :admin do
      admin true
    end
  end
end