class AddRelationships < ActiveRecord::Migration
  def self.up
    add_column :cards, :card_sort_id, :integer
    add_column :card_groups, :card_sort_id, :integer
  end

  def self.down
    remove_column :cards, :card_sort_id
    remove_column :card_groups, :card_sort_id
  end
end
