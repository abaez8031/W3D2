require_relative "board"
require_relative "card"

class Game

    def initialize(num)

        @board = Board.new(num)

        @lines = num

        @guessed_pos = []

    end

    def prep
        @board.populate

    end

    def play

        while !@board.won?
            @board.render
           
            pos = get_position
            @guessed_pos << @board[pos].value
            system("clear")

            @board.reveal(pos)
            


            pos_2 = get_position
            @guessed_pos << @board[pos_2].value

            system("clear")
            @board.reveal(pos_2)
            sleep(5)


            if @guessed_pos[0] == @guessed_pos[1]
                @guessed_pos = []
            else
                @board[pos].hide
                @board[pos_2].hide
                @guessed_pos = []
            end

            system("clear")

        end
        
        @board.render
        p "WINNER!!"
    end

    def valid_position?(num_arr)
        row, col = num_arr

        if (row >= 0 && row <= @lines) && (col >= 0 && col <= @lines) && (!@board.grid[row][col].revealed?)
            return true
        else
            return false
        end

            
    end

    def get_position
        p "Please enter a position on the grid"
        input = gets.chomp
        input_arr = input.split(" ").map { |num| num.to_i }

        if valid_position?(input_arr)
            return input_arr
        else
            raise ArgumentError.new("invalid position")
        end


    end
        


end