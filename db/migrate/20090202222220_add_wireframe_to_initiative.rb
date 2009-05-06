class AddWireframeToInitiative < ActiveRecord::Migration
  def self.up
    add_column :initiatives, :wireframe_id, :integer
    add_column :initiatives, :is_open_entry, :boolean
    add_column :wireframes, :is_active, :boolean
  end

  def self.down
    remove_column :initiatives, :wireframe_id
    remove_column :initiatives, :is_open_entry
    remove_column :wireframes, :is_active
  end
end
