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

    it 'can view a form for sharing a new post' do
      page.find(".new-post-link").click

      expect(current_path).to eq new_post_path
      expect(page).to have_css('.new-post')
      expect(page).to have_css('#post_title')
    end

    it 'can enter title and link for a new post' do
      added_content = "I just added this post"

      visit new_post_path
      fill_in("Title", with: added_content)
      fill_in("Link", with: "http://validsite.com")
      click_on("Share it")

      expect(current_path).to eq root_path 
      expect(page).to have_content added_content
    end

      
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
