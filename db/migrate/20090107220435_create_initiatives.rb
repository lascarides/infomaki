class CreateInitiatives < ActiveRecord::Migration
  def self.up
    create_table :initiatives do |t|
      t.string :name
      t.string :type
      t.boolean :is_active

      t.timestamps
    end
  end

  def self.down
    drop_table :initiatives
  end
end
