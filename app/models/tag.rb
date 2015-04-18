class Tag < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true

  def self.popular
    first(2) # dummy values for now
  end
end
