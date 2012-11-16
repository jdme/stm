class Story < ActiveRecord::Base
  attr_accessible :description, :order_by, :status, :title, :user_id

  validates :order_by, :numericality => true
  validates :user, :title, :status, :description, :presence => true

  belongs_to :user
  has_many :comments, :class_name => 'StoryComment'

  def self.status_list
    #{
    #    N: "New",
    #    S: "Started",
    #    F: "Finished",
    #    A: "Accepted",
    #    R: "Rejected"
    #}
    [:N, :S, :F, :A, :R]
  end
end
