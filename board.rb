require_relative "card"

class Board
  
  # def create_deck
  #   while @deck.length <
  # end


  def initialize(num)
    if num % 2 == 0 && num <= 6
      @grid = Array.new(num) { Array.new(num) }
    else
      raise ArgumentError.new("Number needs to be even and less than or equal to 6")
    end

    alphabet = "abcdefghjiklmnopqrstuvwxyz"
    @deck = []

    i = 0
    while @deck.length < (num ** 2)
      2.times { @deck << alphabet[i].to_sym }
      i += 1
    end
      

  end


  def grid
    @grid
  end

  def deck
    @deck 
  end



  def populate
    (0...@grid.length).each do |i|
      (0...@grid[i].length).each do |j|
        chosen = @deck.sample
        @grid[i][j] = Card.new(chosen)
        @deck.delete_at(@deck.index(chosen))
      end
    end

  end

  def render
    output_grid = []
    @grid.each do |row|
      new_row = []
      row.each do |card|
        if card.revealed? 
          new_row << card.value
        else
          new_row << " "
        end
      end
      output_grid << new_row
    end
    output_grid
  end

  def won?
    @grid.each do |row|
      row.each do |card|
        return false if card.revealed? == false
      end
    end
    true
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  
  def reveal
  end



end
