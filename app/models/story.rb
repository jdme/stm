class Story < ActiveRecord::Base
  attr_accessible :description, :order_by, :status, :title, :user_id

  validates_numericality_of :order_by
  validates_presence_of :user, :title, :status, :description

  belongs_to :user
  has_many :story_comments
end
