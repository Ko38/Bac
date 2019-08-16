require_relative 'card'

class Deck
  attr_reader :cards

  def initialize(cards = Card.all_cards(8).shuffle)
    @cards = cards
  end

  def deal
    @cards.shift
  end

  def cut_card_out?(num = 14)
    count < num
  end

  def count
    @cards.count
  end
end
