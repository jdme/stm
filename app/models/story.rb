class Story < ActiveRecord::Base
  attr_accessible :description, :order_by, :title, :user_id

  validates :order_by, :numericality => true
  validates :user, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true

  belongs_to :user
  has_many :comments

  state_machine :status, :initial => :new do

    state :new, :value => "N"
    state :started, :value => "S"
    state :finished, :value => "F"
    state :accepted, :value => "A"
    state :rejected, :value => "R"

    event :renew do
      transition :accepted => :new
    end

    event :start do
      transition :new => :started, :rejected => :started
    end

    event :finish do
      transition :started => :finished
    end

    event :accept do
      transition :finished => :accepted
    end

    event :reject do
      transition :finished => :rejected
    end

  end

  #def self.status_list
  #  #{
  #  #    N: "New",
  #  #    S: "Started",
  #  #    F: "Finished",
  #  #    A: "Accepted",
  #  #    R: "Rejected"
  #  #}
  #  [:N, :S, :F, :A, :R]
  #end

  def status_event= (event)
    fire_status_event(event) unless event.blank?
  end

end
