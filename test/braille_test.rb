require './test/test_helper'
require './lib/braille_data'

class Braille < MiniTest::Test

  def setup
    @braille = BrailleData.new
  end

  def test_numbers
    assert_equal [".0", "00", ".."], @braille.txt["0"]
    assert_equal ["0.", "..", ".."], @braille.txt["1"]
    assert_equal ["0.", "0.", ".."], @braille.txt["2"]
    assert_equal ["00", "..", ".."], @braille.txt["3"]
    assert_equal ["00", ".0", ".."], @braille.txt["4"]
    assert_equal ["0.", ".0", ".."], @braille.txt["5"]
    assert_equal ["00", "0.", ".."], @braille.txt["6"]
    assert_equal ["00", "00", ".."], @braille.txt["7"]
    assert_equal ["0.", "00", ".."], @braille.txt["8"]
    assert_equal [".0", "0.", ".."], @braille.txt["9"]\
  end

end
