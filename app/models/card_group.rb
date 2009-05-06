class CardGroup < ActiveRecord::Base

  belongs_to :card_sort
  has_many :cards

end
