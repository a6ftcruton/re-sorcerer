require 'uri'

class Post < ActiveRecord::Base
  belongs_to :user
  VALID_URL_REGEX = /(https?:\/\/)?[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]{2,6}(\/.*)?/i
  validates :title, presence: true
  validates :url, format: VALID_URL_REGEX 

  def upvote
    self.votes += 1
    self.save(validate: false)
  end

  def downvote
    self.votes -= 1
    self.save(validate: false)
  end

  def self.sort_by_rank
    all.sort { |a, b| b.votes <=> a.votes }
  end

  def toggle_favorite
    self.favorite = true
    self.save
  end
end
