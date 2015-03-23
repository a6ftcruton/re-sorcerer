require 'rails_helper'

describe 'user' do

  context 'not logged in' do

    it 'visits the homepage' do
      visit_root_page
      expect(page).to have_css '.login-link'
    end

    it 'visits the login page via the homepage' do
      visit_login_page
      expect(current_path).to eq login_path
      expect(page).to have_css '#login'
    end

    it 'creates a new account' do
      visit_login_page
      # fill_in(:email).with("jbones@example.com")
    end

    xit 'logs in with valid credentials' do
    end

    xit 'logs in with invalid credentials' do
    end

    xit 'clicks a link' do
    end

  end

  context 'logged in' do
  end

  private

  def visit_root_page
    visit '/'
  end
  
  def visit_login_page
    visit_root_page
    page.find('.login-link').click
  end
end
