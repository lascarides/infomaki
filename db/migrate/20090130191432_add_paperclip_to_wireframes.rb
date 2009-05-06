class AddPaperclipToWireframes < ActiveRecord::Migration
  def self.up
    add_column :wireframes, :screenshot_file_name, :string
    add_column :wireframes, :screenshot_content_type, :string
    add_column :wireframes, :screenshot_file_size, :integer
  end

  def self.down
    remove_column :wireframes, :screenshot_file_name
    remove_column :wireframes, :screenshot_content_type
    remove_column :wireframes, :screenshot_file_size
  end
end
