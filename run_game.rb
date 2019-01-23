require_relative('./game.rb')
require_relative('./player.rb')
require_relative('./hidden_word.rb')


def start_game

  @player = Player.new("John")
  @hidden_word = HiddenWord.new("Apple")
  @game = Game.new(@player, @hidden_word)

end

def loop_game
  system "clear"
  p "Welcome to SnowMan!! - Press the enter Key"
  gets.chomp
  p "Press enter to play or 'quit' to leave"
  key_input = gets.chomp

  if key_input == 'quit'
    p "Bye Bye, come back soon"
    return
  end

  p "Secret Word Selected.. Choose a letter"
  while(@game.game_over_win_or_lose() == "Not Finished")
    p "Your word --> #{@hidden_word.return_star_version()}"
    p "You have #{@player.return_lives()} chances"

    key_input = gets.chomp

    if key_input == 'quit'
      p "Bye Bye, come back soon"
      return
    end

    if @game.guessing_a_letter(key_input) == true
      p "Good Guess thats the one"
    else
      p "OOOOh so close, but not"
    end
  end
    if @game.game_over_win_or_lose() == "Lose"
      p "Better Luck Next time"
      p "The Full word was #{@hidden_word.return_full_word()}"

    elsif @game.game_over_win_or_lose() == "Win"
      p "The Full word is #{@hidden_word.return_full_word()}"
      p "Congrats!! Nailed it"
      p "You had #{@player.return_lives()} chances left"
    end
  end

start_game()
loop_game()
