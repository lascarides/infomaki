class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :email
      t.boolean :is_admin
      t.boolean :is_superuser
      t.timestamps
    end
    
    User.create!(
      :email => "admin@admin.com", 
      :password => "rootroot", 
      :first_name => "Admin", 
      :last_name => "User", 
      :is_admin=> true, 
      :is_superuser => true
    )
    
    drop_table :people
  end

  def self.down
    drop_table :users
    create_table :people do |t|
      t.timestamps
    end
  end
end
