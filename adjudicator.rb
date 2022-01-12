require './board.rb'

class Adjudicator
    @board = {}

    # first game menu
    def start_menu

        #start menu text 
        puts "Please select from the following options:"
        puts "             1. Start new game"
        puts "             2. Exit"
        print "Selection (1 or 2): "

        while true do
            begin
                start_input = gets.chomp.upcase
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
            play_game(@board.set_ships_on_board(@board.generate_default_board(10, 10)))
        else
            puts "----------------------------------------"
            puts "Exiting Battleships! Thanks for playing!"
            exit
        end

    end

    def play_game(board)
        @attacks = 50
        @hits = 0
        @misses = 0
        @previous_hits = ""
        @previous_misses = ""

        puts "To win, you must destroy your opponent's ships!"
        puts "One battleship = 5 hits each"
        puts "Two destroyers = 4 hits each"
        puts "Three submarines = 3 hits each"
        puts "Four patrol boats = 2 hits each"
        puts "These ships are set out on a 10 x 10 board."

        until @attacks == 0 || @board.check_board_for_ships(board) == false do
            puts "----------------------------------------"
            puts "Hits: #{@hits}"
            puts "Misses: #{@misses}\n"
            puts "Previous hits: #{@previous_hits}"
            puts "Previous misses: #{@previous_misses}\n"
            puts "Number of remaining attacks = #{@attacks}"
            puts "----------------------------------------"
            while true do 
                begin
                    print "enter letter coordinate of attack (A - J): "
                    @letter_key = gets.chomp.upcase
                    print "enter number coordinate of attack (1 - 10): "
                    @number_key = Integer(gets.chomp)
                    if @letter_key.length > 1 || @number_key > 10 || @number_key < 1
                        raise ArgumentError.new()
                    end
                    board[@letter_key][@number_key]
                rescue ArgumentError, TypeError, NoMethodError
                    puts "Invalid response! Please try again."
                    puts "----------------------------------------"
                else
                    break
                end
            end 

            puts "----------------------------------------"
            if board[@letter_key][@number_key] == true
                puts "HIT!"
                @hits += 1
                @previous_hits += @letter_key + @number_key.to_s + " "
            else
                puts "Missed!"
                @misses += 1
                @previous_misses += @letter_key + @number_key.to_s + " "
            end 
            @attacks -= 1
            
        end
        if @attacks == 0 && board.check_board_for_ships(board) == true
            puts "Game over - computer win"
        else
            puts "Congratulations! You won!"
        end
    end
end


        
