require 'pp'    #pretty print

class Board
    # identity => [<boat_size>, <quantity>]
    @@default_ships = {
                            "battleships" => [5, 1],
                            "destroyers" => [4, 2],
                            "submarines" => [3, 3],
                            "patrol boats" => [2, 4],
                      }

    def generate_default_board(rows, columns)
        @letters = ("A".."Z").to_a
        count = 0
        board_hash = {}     # contains rows
        until count == rows do
            board_hash[@letters[count]] = generate_columns(columns)
            count += 1
        end
        return board_hash
    end

    def set_ships_on_board(board_hash, rows, columns)
        count = 0
        ship_count = 1
        #for each key-value pair in default_ships, pick a random position, then progress horizontally or vertically
        @@default_ships.each do |key, value|
            until ship_count > value[1] do
                #pick a row
                rand_index = rand(0..rows-1)
                rand_row = @letters[rand_index]
                puts "#{ship_count} rand_row = #{rand_row}"
                #pick a column
                rand_column = rand(1..columns)
                puts "#{ship_count} rand_column = #{rand_column}"
                if board_hash[rand_row][rand_column] != true
                    board_hash[rand_row][rand_column] = true
                    is_vertical = [true, false].sample
                    if is_vertical
                        until count > value[0] do
                            if rand_index > value[0] && board_hash[@letters[rand_index - count]][rand_column]!= true
                                board_hash[@letters[rand_index - count]][rand_column] = true
                                count += 1
                                puts "if statement vertical = #{count}"
                            else
                                is_vertical = false
                                break
                            end
                        end
                    elsif !is_vertical
                        until count > value[0] do
                            if rand_index > value[0] && board_hash[@letters[rand_index]][rand_column - count] != true
                                board_hash[@letters[rand_index]][rand_column - count] = true
                                count += 1
                                puts "if statement horizontal = #{count}"
                            else
                                break
                            end
                        end
                    end            
                else
                   #need a begin/rescue here
                end
                ship_count += 1 
            end
        end
        return board_hash
    end

    private
    def generate_columns(columns)
        count = 1
        column_hash = {}    # contains the columns in each row
        until count > columns do
            column_hash[count] = false
            count += 1
        end
        return column_hash
    end
    
end

@board = Board.new
board_hash = @board.generate_default_board(10, 10)
pp board_hash
board_hash["A"][1]
puts "---"
@board.set_ships_on_board(board_hash, 10, 10)
pp board_hash


