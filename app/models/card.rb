class Card < ActiveRecord::Base

  belongs_to :card_sort
  belongs_to :card_group

end