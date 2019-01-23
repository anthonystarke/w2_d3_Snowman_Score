class Game

  def initialize(player, hidden_word)
    @player = player
    @hidden_word = hidden_word
    @guessed_letters = []

  end

  def guessing_a_letter(letter_to_check)
      if @hidden_word.letter_check(letter_to_check, @guessed_letters) == false
        @player.reduce_lives()
      end
      @guessed_letters << letter_to_check
    return @hidden_word.letter_check(letter_to_check,@guessed_letters)
  end

  def return_star_version
    return @hidden_word.return_star_version
  end

  def game_over_win_or_lose
      if @player.player_lives_finished() && !@hidden_word.is_word_finished()
        return "Lose"
      elsif !@player.player_lives_finished() && @hidden_word.is_word_finished()
        return "Win"
      end
      return "Not Finished"
  end

end
