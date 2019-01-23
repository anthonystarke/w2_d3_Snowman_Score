require 'minitest/autorun'
require 'minitest/rg'
require_relative('../hidden_word.rb')

class Minitest::Test

  def setup
    @hidden_word = HiddenWord.new("Apple")
    @guess_collection = []
  end

  def test_return_hidden_word
    assert_equal("Apple", @hidden_word.return_full_word)
  end

  def test_return_true_or_false_for_letter__true
    assert_equal(true, @hidden_word.letter_check("a",@guess_collection))
  end

  def test_return_true_or_false_for_letter__false
    assert_equal(false, @hidden_word.letter_check("b",@guess_collection))
  end

  def test_stars_for_secret_word
    assert_equal("*****", @hidden_word.return_star_version())
  end

  def test_letter_passed
    assert_equal(true, @hidden_word.letter_check("A",@guess_collection))
    assert_equal("A****",@hidden_word.return_star_version)
  end

  def test_won_game
    @hidden_word.letter_check("A",@guess_collection)
    assert_equal("A****",@hidden_word.return_star_version)

    @hidden_word.letter_check("p",@guess_collection)
    assert_equal("App**",@hidden_word.return_star_version)

    @hidden_word.letter_check("l",@guess_collection)
    assert_equal("Appl*",@hidden_word.return_star_version)

    assert_equal(false, @hidden_word.is_word_finished())

    @hidden_word.letter_check("e",@guess_collection)
    assert_equal("Apple",@hidden_word.return_star_version)

    assert_equal(true, @hidden_word.is_word_finished())

  end

end
