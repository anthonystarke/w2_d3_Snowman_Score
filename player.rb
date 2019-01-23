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
    @lives -= 1
  end

  def player_lives_finished
    if @lives == 0
      return true
    end
      return false
  end

end
