# battleship planning
# --------------------
# a 10 by 10 board represented in the terminal
# program will have to generate the board randomly and be able to see if a particular square is occupied
#     by a particular boat type
# further ideas: include option for two-player
#                allow player to pick board size and number of ships
# remember: test-driven development
# ideas for structure: some kind of multidimensional array (hash?) that contains booleans? needs to be translated into some kind of unicode in the terminal
# class structure: (remember that each class should have a particular role)
# battleship
# |- adjudicator (welcome and request for board size and numbers of each type of ship)
# |- generate_board (takes the information from adjudicator and uses it to generate the board size and place each ship on the board in a line)
# |- attack (check if a particular location on the board contains part of a ship or not)
# |- update_board (record previous guesses in unicode board depending on if attempt is successful or not)

# things that need randomising
# - horizontal or vertical battleship? (only if longer than two)
# - where in the row/column do you want to start?

# Welcome to Battleship!
# 1. Instructions
# 2. Play default game (10x10 board, 4 patrol boats, 3 submarines, 2 destroyers and 1 battleship)
# Select from the following options:

# rows_board: x
# number of columns: y
# number of battleships (size 5): a
# number of Destroyers (size 4): b
# number of Subs (size 3): c
# number of Patrol boats (size 2): d
# - generate_board takes rows_board and columns_board and turns them into an array with columns_board rows, and rows_board booleans in each row
# - pass ship number and size into determine_position as an argument. the array of arrays will have to be a superclass variable
# - pick a random array from the array of board_rows (exclude if already taken or next to a cell that is)
# - pick a random element from the selected board_row (exclude if already taken or next to a cell that is)
# - if the index before or after is not true then let the element at that index be true else break and redo
# - random to decide if horizontal or vertical
# - perhaps if true some variable can be either x (hit) or o (miss)
# 
#      1   2   3   4   5   6   7   8   9   10
#  A | o | o |   |   |   |   |   |   |   |   |
#  B | x |   |   |   |   |   |   |   |   |   |
#  C |   |   |   |   |   |   |   |   |   |   |
#  D |   |   |   |   |   |   |   |   |   |   |  
#  E |   |   |   |   |   |   |   |   |   |   |  
#  F |   |   |   |   |   |   |   |   |   |   |  
#  G |   |   |   |   |   |   |   |   |   |   |  
#  H |   |   |   |   |   |   |   |   |   |   |  
#  I |   |   |   |   |   |   |   |   |   |   |  
#  J |   |   |   |   |   |   |   |   |   |   |
# ---------------------------------------------
# Misses: o         Patrol ships (2 squares): 4
# Hits: x             Submarines (3 squares): 3
#                     Destroyers (4 squares): 2
#                     Battleship (5 squares): 1
# ---------------------------------------------
#            Remaining attacks:   25
# ---------------------------------------------
# Enter coordinates for next attack (e.g A1): 

require 'adjudicator.rb'
require 'generate_board.rb'
require 'attack.rb'
require 'update_board.rb'