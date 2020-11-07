require './test/test_helper'
require './lib/debrailler'

class DebraillerTest < MiniTest::Test

  def setup
    message = ["000.000.000...000.",
                ".0.0...0.0.0.....0",
                "......0.......0..."]
    @debrailler = Debrailler.new(message)
  end

  def test_braille_compiler
    expected = ["000.000.000...000.",
                ".0.0...0.0.0.....0",
                "......0.......0..."]

    assert_equal expected, @debrailler.braille_in
  end

  def test_more_or_less

    assert_nil @debrailler.more_or_less
  end

  def test_braille_reverter
    expected = "......0.......0..."

    assert_equal expected, @debrailler.braille_reverter
  end

  def test_braille_reverter_over_80
    message = ["000.000.000...000.",
                ".0.0...0.0.0.....0",
                "......0.......0..."]
    debrailles = Debrailler.new(message)
    debrailles.stubs(:more_or_less).returns("lines sliced 0..79")
      expected = "lines sliced 0..79"
    assert_equal expected, debrailles.more_or_less
  end

  def test_braille_output
    @debrailler.braille_reverter
    expected = [["00", ".0", ".."],
                ["0.", ".0", ".."],
                ["00", "..", ".."],
                ["0.", ".0", "0."],
                ["00", ".0", ".."],
                ["0.", ".0", ".."],
                ["..", "..", ".."],
                ["00", "..", "0."],
                ["0.", ".0", ".."]]
    assert_equal expected, @debrailler.braille_output
  end

  def test_reverse_txt

    assert_equal [["..", "..", ".."], " "], @debrailler.reverse_txt.first
  end

  def test_reverse_num

    assert_equal [[".0", ".0", "00"], "#"], @debrailler.reverse_num.first
  end

  def test_to_char
    @debrailler.more_or_less
    @debrailler.braille_output
    expected = "decode me"
    assert_equal expected, @debrailler.to_char
  end

  def test_more_or_less_to_the_extreme
    message = ["..0..0000.00...0.000.0....000.0000.0000.0.0.0000.00......00..00..0......0.0.0.0.",
    "..0.0..0.0.0..000..00.....0..0.0.00..00.0....0.00...00...00.000.0000....0..0.0..",
    ".0........0....0..0.0....00...0.0.0.000.00..0.0......0..00........0....00.0.0.0.",
    ".00000..000.0..00.0.00...00....00.0...000.00.0...000....000.0.0..0..",
    "0..000..0..00000..00.0..00.0..0000.0...0.0..00...0.0.....0.0..000.00",
    "..0.......0.0..0..0.....0.0...0.......0...000...00......00....0.0.0."]

    debraillster = Debrailler.new(message)
    expected = "Biden wins Pennsylvannia. 2020 Looking forward to the next 4  years!"
    debraillster.more_or_less
    debraillster.braille_output
    assert_equal expected, debraillster.to_char
  end
end
