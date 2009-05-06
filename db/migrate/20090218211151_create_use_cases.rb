class CreateUseCases < ActiveRecord::Migration

  def self.up
    create_table :use_cases do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
    create_table :use_cases_user_stories do |t|
      t.integer :use_case_id
      t.integer :user_story_id
    end
  end

  def self.down
    drop_table :use_cases
    drop_table :use_cases_user_stories
  end

end
