class AddFieldsToPeople < ActiveRecord::Migration
  def self.up
    create_table :organizations_testees do |t|
      t.integer :organization_id
      t.integer :testee_id
    end
    Organization.create!(:name => "New York Public Library")
  end

  def self.down
    Organization.destroy_all
    drop_table :organizations_testees
  end
end
