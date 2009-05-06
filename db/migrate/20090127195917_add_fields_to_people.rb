class AddFieldsToPeople < ActiveRecord::Migration
  def self.up
    add_column :people, :type, :string
    add_column :people, :session_id, :string
    create_table :organizations_testees do |t|
      t.integer :organization_id
      t.integer :testee_id
    end
    Organization.create!(:name => "New York Public Library")
  end

  def self.down
    Organization.destroy_all
    drop_table :organizations_testees
    remove_column :people, :type
    remove_column :people, :session_id
  end
end
