require './test/test_helper'
require './lib/library'

class Braille < MiniTest::Test

  def setup
    @braille = Library.new
  end

  def test_existence

    assert_instance_of Library, @braille
    assert_equal FileReadWrite, @braille.reader.class
  end

  def test_letters
    assert_equal 34, @braille.letters.count
    assert_equal CharBraille, @braille.letters.first.class
  end

  def test_numbers

    assert_equal 11, @braille.numbers.count
    assert_equal CharBraille, @braille.numbers.first.class
  end

  def test_valid_txt?

    assert_equal true, @braille.valid_text?("a")
    assert_equal false, @braille.valid_text?("2")
  end

  def test_valid_num?

    assert_equal true, @braille.valid_num?("5")
    assert_equal false, @braille.valid_num?("y")
  end

  def test_num
    assert_equal [".0", "00", ".."], @braille.num("0")
    assert_equal ["0.", "..", ".."], @braille.num("1")
    assert_equal ["0.", "0.", ".."], @braille.num("2")
    assert_equal ["00", "..", ".."], @braille.num("3")
    assert_equal ["00", ".0", ".."], @braille.num("4")
    assert_equal ["0.", ".0", ".."], @braille.num("5")
    assert_equal ["00", "0.", ".."], @braille.num("6")
    assert_equal ["00", "00", ".."], @braille.num("7")
    assert_equal ["0.", "00", ".."], @braille.num("8")
    assert_equal [".0", "0.", ".."], @braille.num("9")
    assert_equal [".0", ".0", "00"], @braille.num("#")
  end

  def test_characters
    assert_equal ["..", "00", "0."], @braille.txt("!")
    assert_equal ["..", "..", "0."], @braille.txt("'")
    assert_equal ["..", "0.", ".."], @braille.txt(",")
    assert_equal ["..", "..", "00"], @braille.txt("-")
    assert_equal ["..", "00", ".0"], @braille.txt(".")
    assert_equal ["..", "0.", "00"], @braille.txt("?")
    assert_equal ["..", "..", ".0"], @braille.txt("caps")
    assert_equal ["..", "..", ".."], @braille.txt(" ")
  end

  def test_the_letters
    assert_equal ["0.", "..", ".."], @braille.txt("a")
    assert_equal ["0.", "0.", ".."], @braille.txt("b")
    assert_equal ["00", "..", ".."], @braille.txt("c")
    assert_equal ["00", ".0", ".."], @braille.txt("d")
    assert_equal ["0.", ".0", ".."], @braille.txt("e")
    assert_equal ["00", "0.", ".."], @braille.txt("f")
    assert_equal ["00", "00", ".."], @braille.txt("g")
    assert_equal ["0.", "00", ".."], @braille.txt("h")
    assert_equal [".0", "0.", ".."], @braille.txt("i")
    assert_equal [".0", "00", ".."], @braille.txt("j")
    assert_equal ["0.", "..", "0."], @braille.txt("k")
    assert_equal ["0.", "0.", "0."], @braille.txt("l")
    assert_equal ["00", "..", "0."], @braille.txt("m")
    assert_equal ["00", ".0", "0."], @braille.txt("n")
    assert_equal ["0.", ".0", "0."], @braille.txt("o")
    assert_equal ["00", "0.", "0."], @braille.txt("p")
    assert_equal ["00", "00", "0."], @braille.txt("q")
    assert_equal ["0.", "00", "0."], @braille.txt("r")
    assert_equal [".0", "0.", "0."], @braille.txt("s")
    assert_equal [".0", "00", "0."], @braille.txt("t")
    assert_equal ["0.", "..", "00"], @braille.txt("u")
    assert_equal ["0.", "0.", "00"], @braille.txt("v")
    assert_equal [".0", "00", ".0"], @braille.txt("w")
    assert_equal ["00", "..", "00"], @braille.txt("x")
    assert_equal ["00", ".0", "00"], @braille.txt("y")
    assert_equal ["0.", ".0", "00"], @braille.txt("z")
  end

end
