require_relative "board"
require_relative "card"
require "byebug"

class Game

    def initialize(num)

        @board = Board.new(num)

        @guessed_pos = []

    end

    def prep
        @board.populate

    end

    def play

        while !@board.won?
            @board.render
            input = gets.chomp
            
            pos = input.split(" ").map { |num| num.to_i }
            @guessed_pos << @board[pos].value

            @board.reveal(pos)
            
            input_2 = gets.chomp
            pos_2 = input_2.split(" ").map { |num| num.to_i }
            @guessed_pos << @board[pos_2].value
            @board.reveal(pos_2)

            if @guessed_pos[0] == @guessed_pos[1]
                @guessed_pos = []
            else
                @board[pos].hide
                @board[pos_2].hide
                @guessed_pos = []
            end



        end
        

    end


end