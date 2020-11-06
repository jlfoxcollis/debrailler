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

  def test_characters
    assert_equal ["..", "00", "0."], @braille.txt["!"]
    assert_equal ["..", "..", "0."], @braille.txt["'"]
    assert_equal ["..", "0.", ".."], @braille.txt[","]
    assert_equal ["..", "..", "00"], @braille.txt["-"]
    assert_equal ["..", "00", ".0"], @braille.txt["."]
    assert_equal ["..", "0.", "00"], @braille.txt["?"]
    assert_equal ["..", "..", ".0"], @braille.txt["Caps"]
    assert_equal ["..", "..", ".."], @braille.txt[" "]
  end

  def test_the_letters
    assert_equal ["0.", "..", ".."], @braille.txt["a"]
    assert_equal ["0.", "0.", ".."], @braille.txt["b"]
    assert_equal ["00", "..", ".."], @braille.txt["c"]
    assert_equal ["00", ".0", ".."], @braille.txt["d"]
    assert_equal ["0.", ".0", ".."], @braille.txt["e"]
    assert_equal ["00", "0.", ".."], @braille.txt["f"]
    assert_equal ["00", "00", ".."], @braille.txt["g"]
    assert_equal ["0.", "00", ".."], @braille.txt["h"]
    assert_equal [".0", "0.", ".."], @braille.txt["i"]
    assert_equal [".0", "00", ".."], @braille.txt["j"]
    assert_equal ["0.", "..", "0."], @braille.txt["k"]
    assert_equal ["0.", "0.", "0."], @braille.txt["l"]
    assert_equal ["00", "..", "0."], @braille.txt["m"]
    assert_equal ["00", ".0", "0."], @braille.txt["n"]
    assert_equal ["0.", ".0", "0."], @braille.txt["o"]
    assert_equal ["00", "0.", "0."], @braille.txt["p"]
    assert_equal ["00", "00", "0."], @braille.txt["q"]
    assert_equal ["0.", "00", "0."], @braille.txt["r"]
    assert_equal [".0", "0.", "0."], @braille.txt["s"]
    assert_equal [".0", "00", "0."], @braille.txt["t"]
    assert_equal ["0.", "..", "00"], @braille.txt["u"]
    assert_equal ["0.", "0.", "00"], @braille.txt["v"]
    assert_equal [".0", "00", ".0"], @braille.txt["w"]
    assert_equal ["00", "..", "00"], @braille.txt["x"]
    assert_equal ["00", ".0", "00"], @braille.txt["y"]
    assert_equal ["0.", ".0", "00"], @braille.txt["z"]
  end

end
