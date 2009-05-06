class CreateCardGroups < ActiveRecord::Migration
  def self.up
    create_table :card_groups do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :card_groups
  end
end
