require 'bcrypt'
include BCrypt

FactoryGirl.define do
  factory :user do
    username "johnny5" 
    email "johnny5@example.com"
    password "abc123"
    password_digest Password.create("abc123")
  end

  factory :post do
    title "this is the title I'm giving to my link"
    url "http://jimsuttondev.com"
    user_id :user
    favorite false
  end
end
