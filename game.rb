require_relative 'deck'
require_relative 'card'

$banker_win = 0
$player_win = 0
$tie = 0

def actual_value(num)
  num % 10
end

def settle(player_value, banker_value)
  $banker_win += 1 if banker_value > player_value
  $player_win += 1 if player_value > banker_value 
  $tie += 1 if banker_value == player_value
end

def banker_draw_3?(banker_value, player3)
  if banker_value <= 2
    return true 
  elsif banker_value == 3 
    if player3 != 8
      return true 
    end
  elsif banker_value == 4
    if [2,3,4,5,6,7].include?(player3)
      return true
    end
  elsif banker_value == 5
    if [4,5,6,7].include?(player3)
      return true
    end
  elsif banker_value == 6
    if [6,7].include?(player3)
      return true
    end
  end
  return false

end

(0...100000).each do |i| 
  deck = Deck.new
  while !deck.cut_card_out?
    player1 = deck.deal
    banker1 = deck.deal
    player2 = deck.deal
    banker2 = deck.deal

    player_total = player1.value + player2.value
    banker_total = banker1.value + banker2.value 
    if actual_value(player_total) >= 8 || actual_value(banker_total) >= 8 
      settle(actual_value(player_total), actual_value(banker_total))
      next
    end
    player3Value = 0 
    player_drawn = false
    if player_total <= 5
      player3Value = deck.deal.value
      player_total += player3Value
      player_drawn = true
    end

    banker3Value = 0
    if player_drawn 
      if banker_draw_3?(actual_value(banker_total), player3Value)
        banker3Value = deck.deal.value
      end
    elsif actual_value(banker_total) <= 5
        banker3Value = deck.deal.value
    end
    banker_total += banker3Value
    settle(actual_value(player_total), actual_value(banker_total))

  end
end

p $banker_win 
p $player_win 
p $tie 