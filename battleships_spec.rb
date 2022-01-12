# planning
# ------------------
# need to check if the board is the correct size and generates the correct number of ships in a permitted arrangement (horizontal/vertical)

require './board.rb'

describe Board do
    describe "#generate_default_board" do
        it "returns a one-by-three board when 1 (rows) and 3 (columns) are entered as arguments" do
            #setup
            @board = Board.new
            test_board = @board.generate_default_board(1, 3)

            #execution
            rows = 0
            columns = 0
            test_board.each do |key, value|
                rows += 1
                columns = 0 #reset
                value.each do |k, v|
                    columns += 1
                end
            end

            #expectation
            expect(rows).to eq(1)
            expect(columns).to eq(3)
        end

        it "returns a three-by-one board when 3 (rows) and 1 (columns) are entered as arguments" do
            #setup
            @board = Board.new
            test_board = @board.generate_default_board(3, 1)

            #execution
            rows = 0
            columns = 0
            test_board.each do |key, value|
                rows += 1
                columns = 0 #reset
                value.each do |k, v|
                    columns += 1
                end
            end

            #expectation
            expect(rows).to eq(3)
            expect(columns).to eq(1)
        end

        it "returns an empty board" do
            #setup
            @board = Board.new
            test_board = @board.generate_default_board(3, 3)

            #execution
            result = true
            test_board.each do |key, value|
                value.each do |k, v|
                    if v == true
                        result = false  #the starting board isn't empty
                    end
                end
            end

            #expectation
            expect(result).to eq(true)
        end
    end

    describe "#check_board_for_ships" do
        it "correctly returns true when there are ships on the board" do
            #setup
            @board = Board.new
            test_board = {
                "A"=> {
                    1=>false,
                    2=>true
                },
                "B"=> {
                    1=>false,
                    2=>false
                }
            }
        
            #execution
            result = @board.check_board_for_ships(test_board)
            
            #expectation
            expect(result).to eq(true)
        end

        it "correctly returns false when there are no ships on the board" do
            #setup
            @board = Board.new
            test_board = {
                "A"=> {
                    1=>false,
                    2=>false
                },
                "B"=> {
                    1=>false,
                    2=>false
                }
            }
        
            #execution
            result = @board.check_board_for_ships(test_board)
            
            #expectation
            expect(result).to eq(false)
        end
    end
end

                
