class Story < ActiveRecord::Base
  attr_accessible :description, :order_by, :title, :user_id

  validates :order_by, :numericality => true, :allow_blank => true
  validates :user, :presence => true
  validates :title, :presence => true
  validates :description, :presence => true

  belongs_to :user
  has_many :comments

  scope :sorted, :order => "order_by DESC"

  state_machine :status, :initial => :new do

    state :new
    state :started
    state :finished
    state :accepted
    state :rejected

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

  def order_by=(value)
    write_attribute(:order_by, value.to_i)
  end

end
