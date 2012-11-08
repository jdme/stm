class Story < ActiveRecord::Base
  attr_accessible :description, :orderby, :status, :title, :user_id
end
