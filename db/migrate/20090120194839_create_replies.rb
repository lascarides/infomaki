class CreateReplies < ActiveRecord::Migration
  def self.up
    create_table :replies do |t|
      t.string    :remote_ip
      t.string    :session_id
      t.integer   :initiative_id
      t.integer   :coordinate_x
      t.integer   :coordinate_y
      t.text      :long_answer
      t.string    :short_answer
      t.integer   :reply_item_id
      t.timestamps
    end
  end

  def self.down
    drop_table :replies
  end
end
