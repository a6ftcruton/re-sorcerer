require 'rails_helper'

puts "running SESSION spec"

describe 'user login' do

  it 'visits login page from site root' do
    visit_login_page

    expect(current_path).to eq login_path
  end

  before do
    visit_login_page
  end

  context 'valid credentials' do
    it 'username and password' do
      user = create(:user)

      fill_in("Email", with: user.email)
      fill_in("Password", with: user.password)
      click_on("Sign In")

      expect(current_path).to eq root_path
      expect(page).to have_content "Login successful"
      expect(page).to_not have_css '.login-link'
    end

  end

  context 'invalid credentials' do
    it 'wrong password' do
      user = create(:user, password: "abc123")

      fill_in("Email", with: user.email)
      fill_in("Password", with: "x")
      click_on("Sign In")

      expect(current_path).to eq login_path
      expect(page).to have_content "Check your email and password. No user on file with the credentials you supplied."
    end

    it 'blank username field' do
      fill_in("Password", with: "x")
      click_on("Sign In")

      expect(current_path).to eq login_path
    end
  end
end

describe 'user logout' do
  it 'clicks logout link' do
    authenticate_and_login_user
    click_on "Logout"
    
    expect(current_path).to eq root_path
    expect(page).to have_content "You are now logged out"
    expect(page).to_not have_css '.logout-link'
  end
end

  private

    def visit_login_page
      visit root_path
      click_on("Login")
    end
