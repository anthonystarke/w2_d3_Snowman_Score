require 'minitest/autorun'
require 'minitest/rg'
require_relative('../player.rb')

class Minitest::Test

  def setup

    @player = Player.new("John")

  end

  def test_player_name
    assert_equal("John", @player.name)
  end

  def test_lives
    assert_equal(6, @player.return_lives())
  end

  def test_remove_lives
    assert_equal(6, @player.return_lives())
    @player.reduce_lives()
    assert_equal(5, @player.return_lives())
  end

end
