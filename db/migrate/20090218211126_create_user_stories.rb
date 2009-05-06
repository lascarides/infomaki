class CreateUserStories < ActiveRecord::Migration
  def self.up
    create_table :user_stories do |t|
      t.string :name
      t.text :description
      t.integer :parent_id
      t.timestamps
    end
  end

  def self.down
    drop_table :user_stories
  end
end
