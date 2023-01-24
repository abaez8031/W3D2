class Board
  
  def initialize(num)
    if num % 2 == 0
      @grid = Array.new(num) { Array.new(num) }
    else
      raise ArgumentError.new("Number needs to be even")
    end
  end

end
