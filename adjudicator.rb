require './board.rb'

class Adjudicator
    @board = {}

    # first game menu - determines
    def start_menu
        puts "         Welcome to Battleships!"
        puts "----------------------------------------"


        #start menu text 
        puts "Please select from the following options:"
        puts "             1. Start game"
        puts "             2. Exit"
        print "Selection (1 or 2): "

        while true do
            begin
                start_input = gets.chomp
                start_input = Integer(start_input)
                if start_input > 2 || start_input < 1
                    raise ArgumentError.new()
                end
            rescue ArgumentError, TypeError
                puts "Invalid response! Please try again."
            else
                break
            end
        end

        if start_input == 1
            @board = Board.new
            @board.generate_default_board
        else
            puts "----------------------------------------"
            puts "Exiting Battleships! Thanks for playing!"
            exit
        end

    end

end


        
