class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password

  validates :password, :presence => true, :on => :create
  validates :name, :presence => true
  validates :email, :presence => true, :email => true

  has_many :comments
  has_many :stories

end
