require 'minitest/autorun'
require 'minitest/rg'
require_relative('../hidden_word.rb')

class Minitest::Test

  def setup
    @hidden_word = HiddenWord.new("Apple")
  end

  def test_return_hidden_word
    assert_equal("Apple", @hidden_word.return_full_word)
  end

  def test_return_true_or_false_for_letter__true
    assert_equal(true, @hidden_word.letter_check("a"))
  end

  def test_return_true_or_false_for_letter__false
    assert_equal(false, @hidden_word.letter_check("b"))
  end

  def test_stars_for_secret_word
    assert_equal("*****", @hidden_word.return_star_version())
  end

  def test_letter_passed
    assert_equal(true, @hidden_word.letter_check("A"))

    assert_equal("A****",@hidden_word.return_star_version)
  end

end
