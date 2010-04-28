class Player

  def initialize(name)
    @score = 0
    @name = name
  end

  attr_reader :name
  attr_accessor :score

end

