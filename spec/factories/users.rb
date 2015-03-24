require 'bcrypt'
include BCrypt

FactoryGirl.define do
  factory :user do
    username "johnny5" 
    email "johnny5@example.com"
    password "abc123"
    password_digest Password.create("abc123")
  end
end
