require 'minitest/autorun'
require 'minitest/rg'
require_relative('../game.rb')
require_relative('../player.rb')
require_relative('../hidden_word.rb')


class Minitest::Test

  def setup
    @player = Player.new("John")
    @hidden_word = HiddenWord.new("Apple")
    @guessed_letters = []
    @game = Game.new(@player, @hidden_word)
  end

  def test_game_letter_guess__true
    assert_equal(true, @game.guessing_a_letter("a"))
  end

  def test_return_stars_in_word
    assert_equal("*****",@game.return_star_version)
  end

  def test_false_letter_guess
    assert_equal(false, @game.guessing_a_letter("C"))
  end

  def test_remove_lives_if_false
    @game.guessing_a_letter("C")
    assert_equal(5, @player.return_lives())
  end

end
