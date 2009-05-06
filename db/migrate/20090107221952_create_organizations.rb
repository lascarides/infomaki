class CreateOrganizations < ActiveRecord::Migration
  def self.up
    create_table :organizations do |t|
      t.string :name
      t.timestamps
    end
    add_column :initiatives, :organization_id, :integer
  end

  def self.down
    drop_table :organizations
    remove_column :initiatives, :organization_id
  end
end
