require_relative "./Card.rb"
require_relative "./Board.rb"

class Game
    def initialize

    end

    def make_guess(pos1, pos2)
        #Scoping issue here.... we didn't get to figure this out
        our_board.grid[pos1[0]][pos1[1]] == our_board.grid[pos2[0]][pos2[1]]
    end
end

if __FILE__ == $PROGRAM_NAME
    memory_puzzle = Game.new
    our_board = Board.new
    our_board.populate

    until our_board.won?
        our_board.render
        pos = memory_puzzle.prompt_guess
        second_guess? = true

        until second_guess? == false
            second_guess? = false
            if second_guess?
                our_board.reveal_card(current_guess)
                if !memory_puzzle.make_guess(current_guess, previous_guess)
                    sleep(2)
                    our_board.grid[previous_guess[0]][previous_guess[1]].hide
                    our_board.grid[current_guess[0]][current_guess[1]].hide
                end
            else
                our_board.reveal_card(pos)
                previous_guess = pos
            end
            second_guess? = true
        end
    end
end

# what does guessing game do?
# 1 - render an empty grid to user
# 2 - prompts user for guess
# 3 - reveals card at guess
# 4 - prompt for guess # 2
# 5 - reveal card at guess 2
# 6 - determine if user guesses are a match
# 7 - if not a match, after ~2 seconds hide cards again
# 8 - if is a match, reveal two cards and keep them face up
# 9 - continue until won? == true

