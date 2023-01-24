class Card
  
  def initialize(value)
    @value = value
    @revealed = false
  end

  def value
    @value
  end

  def revealed?
    @revealed
  end

  def hide
    @revealed = false if revealed?
  end

  def reveal
    @revealed = true if !revealed?
  end

  def ==(comparison_card)
    return true if self.value == comparison_card.value
    false
  end

  def to_s
    self.value.to_s
  end

end