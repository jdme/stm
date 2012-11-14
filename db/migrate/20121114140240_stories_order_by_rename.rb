class StoriesOrderByRename < ActiveRecord::Migration
  def up
    rename_column :stories, :orderby, :order_by
  end

  def down
    rename_column :stories, :order_by, :orderby
  end
end
