FactoryGirl.define do
  factory :user do
    username "johnny5" 
    email "johnny5@example.com"
    password_digest "abc123"
  end
end
