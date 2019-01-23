class Player

  attr_reader :name

  def initialize(name)
    @name = name
    @lives = 6
  end

  def return_lives
    return @lives
  end

  def reduce_lives
    @lives-=1
  end

end
