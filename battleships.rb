require './adjudicator.rb'
require './board.rb'

@adjudicator = Adjudicator.new
puts "         Welcome to Battleships!"
puts "----------------------------------------"
while true do
    @adjudicator.start_menu
end
