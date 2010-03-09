class DiceSet
  attr_reader :values
  def roll(n)
    @values = (1..n).map { rand(6) + 1 }
  end

  def find_all(&block)
    @values.find_all(&block)
  end

end
