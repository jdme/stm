class Story::Comment < ActiveRecord::Base
  attr_accessible :comment, :story_id, :user_id

  validates :user, :story, :comment, :presence => true

  belongs_to :user
  belongs_to :story
end
