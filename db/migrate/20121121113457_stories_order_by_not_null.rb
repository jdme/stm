class StoriesOrderByNotNull < ActiveRecord::Migration
  def up
    Story.update_all({:order_by => 0},{:order_by => nil})
    change_column :stories, :order_by, :integer, :null => false, :default => 0
  end

  def down
    change_column :stories, :order_by, :integer, :null => true, :default => nil
    Story.update_all({:order_by => nil},{:order_by => 0})
  end
end
