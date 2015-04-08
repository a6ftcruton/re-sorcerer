class Tag < ActiveRecord::Base
  belongs_to :taggable, polymorphic: true

  def self.popular
    first(3) # dummy values for now
  end
end
