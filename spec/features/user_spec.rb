require 'rails_helper'

describe 'user signup' do

  before do
    visit_signup_page
  end

  it 'valid credentials' do
    fill_in("Email", with: "jbones@example.com")
    fill_in("Username", with: "jbnz")
    fill_in("Password", with: "password123")
    fill_in("Password confirmation", with: "password123")
    click_on("Sign Up")

    expect(current_path).to eq root_path
    expect(page).to have_content "Account created successfully"
  end

  it 'with username that is already in use' do
    # fill_in("Email", with: "jbones@example.com")
    # fill_in("Username", with: "jbnz")
    # fill_in("Password", with: "password123")
    # fill_in("Password confirmation", with: "password123")
    # click_on("Sign Up")
  end

  it 'with password confirmation that does not match password' do
  end

  private

  def visit_signup_page
    visit_root
    page.find(".signup-link").click
    expect(current_path).to eq signup_path
  end

  def visit_root
    visit '/'
  end
end
