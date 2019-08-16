class Card
  SUIT_STRINGS = {
    clubs: '♣',
    diamonds: '♦',
    hearts: '♥',
    spades: '♠'
  }

  VALUE_STRINGS = {
    ace: 'A',
    deuce: '2',
    three: '3',
    four: '4',
    five: '5',
    six: '6',
    seven: '7',
    eight: '8',
    nine: '9',
    ten: '10',
    jack: 'J',
    queen: 'Q',
    king: 'K'
  }

  attr_reader :suit

  def self.all_cards(shoes = 1)
    cards = []
    (0...shoes).each do |i|
      Card.suits.each do |suit|
        Card.values.each do |value|
          cards << Card.new(suit, value)
        end
      end
    end
    cards
  end

  def value 
    tens = ['J', 'Q', 'K']
    return 10 if tens.include?(@value)

    return 1 if @value == 'A'

    @value.to_i
  end

  def self.suits
    SUIT_STRINGS.values
  end

  def self.values
    VALUE_STRINGS.values
  end

  def initialize(suit, value)
    raise StandardError if suit == nil || value == nil
    if !Card.values.include?(value) || !Card.suits.include?(suit)
      raise StandardError 
    end

    @suit = suit
    @value = value
  end
end
