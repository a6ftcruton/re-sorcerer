require 'rails_helper'

puts "running SIGNUP spec"

describe 'user signup' do

  before do
    visit_signup_page
  end

  it 'valid credentials' do
    create_account

    expect(current_path).to eq root_path
    expect(page).to have_content "Account created successfully"
  end

  it 'with email and username that is already in use' do
    create_account
    visit_signup_page
    create_account
    
    expect(current_path).to eq users_path
    expect(page).to have_content "Email has already been taken"
    expect(page).to have_content "Username has already been taken"
  end

  it 'with password confirmation that does not match password' do
    fill_in("Email", with: "llbeansexample.com")
    fill_in("Username", with: "bnz")
    fill_in("Password", with: "password123")
    fill_in("Password confirmation", with: "password456")
    click_on("Sign Up")

    expect(current_path).to eq users_path
    expect(page).to have_content "Password confirmation doesn't match"
  end

  private

    def visit_signup_page
      visit_root
      page.find(".signup-link").click
      expect(current_path).to eq new_user_path
    end

    def visit_root
      visit '/'
    end

    def create_account
      fill_in("Email", with: "jbones@example.com")
      fill_in("Username", with: "jbnz")
      fill_in("Password", with: "password123")
      fill_in("Password confirmation", with: "password123")
      click_on("Sign Up")
    end
end
