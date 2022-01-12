require 'pp'    #pretty print
require './utils.rb'

class Board

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

    def set_ships_on_board(board_hash)  

        # since I am practicing unit testing, I'm going with hard-coding in a particular ship setup.
        # battleship
        board_hash["C"][6] = true
        board_hash["C"][7] = true
        board_hash["C"][8] = true
        board_hash["C"][9] = true
        board_hash["C"][10] = true
        # destroyer 1
        board_hash["D"][2] = true
        board_hash["E"][2] = true
        board_hash["F"][2] = true
        board_hash["G"][2] = true
        # destroyer 2
        board_hash["I"][6] = true
        board_hash["I"][7] = true
        board_hash["I"][8] = true
        board_hash["I"][9] = true
        # submarine 1
        board_hash["A"][1] = true
        board_hash["A"][2] = true
        board_hash["A"][3] = true
        # submarine 2
        board_hash["E"][10] = true
        board_hash["F"][10] = true
        board_hash["G"][10] = true
        # submarine 3
        board_hash["J"][1] = true
        board_hash["J"][2] = true
        board_hash["J"][3] = true
        # patrol boat 1
        board_hash["A"][6] = true
        board_hash["A"][7] = true
        # patrol boat 2
        board_hash["E"][1] = true
        board_hash["F"][1] = true
        # patrol boat 3
        board_hash["E"][5] = true
        board_hash["F"][5] = true
        # patrol boat 4
        board_hash["F"][8] = true
        board_hash["G"][8] = true

        return board_hash
    end

    def check_board_for_ships(board_hash)
        board_hash.each do |key, value|
            break unless value.each do |k, v|
                if v == true
                    return true
                end
            end
        end
        return false
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



