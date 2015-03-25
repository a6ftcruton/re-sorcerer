require 'rails_helper'

describe 'posts' do

  context 'unauthenticated user' do
    it 'cannot post' do
      visit root_path
      expect(page).to_not have_css '.add-post-link'
    end
  end

  context 'authenticated user' do
    before do
      create(:post)
      authenticate_and_login_user
    end

    it 'can see all posts' do
      new_post = create(:post, title: "first post")
      visit root_path 
      expect(page).to have_content new_post.title
    end

    it 'can open an external link in new window' do
      external_url = "http://google.com"
      title = "magic"
      post = create(:post, title: title,  url: external_url)

      visit root_path
      link = find_link(title)

      expect(link[:href]).to eq external_url
      expect(link[:target]).to eq "_blank" 
    end

    it 'can share a post' do
      # click_on("Share a link")
      page.find(".new-post-link").click
      expect(current_path).to eq new_post_path
    end
      # I see a link to "share a link"
      # when I click on the link
      # I see a form that asks for:
      #   link, title, image(optional
      
      #viewing individual post
      #voting up
      #voting down
        
      # filtering posts by 
        # newest
        # most popular
        # categories *
        # comments *
  end
end

  private

  def login
  end
