require 'rails_helper'

RSpec.describe Post, :type => :model do
  it 'is valid' do
    post = build(:post, title: "my title", url: "http://google.com")
    expect(post).to be_valid
  end

  it 'is invalid without a title' do
    post = build(:post, title: "", url: "http://google.com")
    expect(post).to be_invalid
  end

  it 'is invalid without a url' do
    post = build(:post, title: "title", url: "")
    expect(post).to be_invalid
  end

  it 'is invalid without valid url' do
    post = build(:post, title: "bad site", url: "google")
    expect(post).to be_invalid
  end

  it 'is invalid if url is missing domain' do
    second_post = build(:post, title: "bad site", url: "http://google")
    expect(second_post).to be_invalid
  end

  it 'is has a vote value of zero when first created' do
    post = create(:post)
    expect(post.votes).to eq 0
  end

  it 'is associated with the user who created it' do
    user = create(:user)
    post = create(:post, user_id: user.id)

    expect(post).to respond_to :user_id
    expect(post.user_id).to eq user.id 
  end
end
