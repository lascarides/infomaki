class AddTimerToReplies < ActiveRecord::Migration
  def self.up
    add_column :replies, :elapsed_time, :float
  end

  def self.down
    remove_column :replies, :elapsed_time
  end
end
