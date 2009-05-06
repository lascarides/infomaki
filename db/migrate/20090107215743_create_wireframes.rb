class CreateWireframes < ActiveRecord::Migration
  def self.up
    create_table :wireframes do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :wireframes
  end
end
