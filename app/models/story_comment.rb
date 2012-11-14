class StoryComment < ActiveRecord::Base
  attr_accessible :comment, :story_id, :user_id

  validates_presence_of :user, :story, :comment

  belongs_to :user
  belongs_to :story
end
