class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.text :body
      t.integer :quiz_id
      t.boolean :is_correct
      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
