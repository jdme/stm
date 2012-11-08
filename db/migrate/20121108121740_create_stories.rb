class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.string :status
      t.integer :orderby
      t.integer :user_id

      t.timestamps
    end
  end
end
