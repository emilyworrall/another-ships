require_relative 'game_setup'

fleet1 = [Ship.aircraft_carrier, Ship.battleship, Ship.destroyer, Ship.submarine, Ship.patrol_boat ]

count = 0
fleet1.each do |x|
  puts x
  count += 1
  break if count == 2
end