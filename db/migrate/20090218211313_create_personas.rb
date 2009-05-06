class CreatePersonas < ActiveRecord::Migration
  def self.up
    create_table :personas do |t|
      t.string :name
      t.text :bio
      t.integer :age

      t.timestamps
    end
    create_table :personas_user_stories do |t|
      t.integer :persona_id
      t.integer :user_story_id
    end
  end

  def self.down
    drop_table :personas
    drop_table :personas_user_stories
  end
end
