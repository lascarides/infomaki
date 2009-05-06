class CardSort < Initiative

  has_many :cards
  has_many :card_groups

  def get_card(testee)
    self.cards.first.name
  end
  
  def get_card_matches(card)
    matches = (self.card_groups.count > 0) ? self.card_groups : self.cards
    matches = matches.collect { |cg| cg.name }
    matches.delete card
    matches
  end

end
