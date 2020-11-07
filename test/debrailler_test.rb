require './test/test_helper'
require './lib/debrailler'

class DebraillerTest < MiniTest::Test

  def setup
    message = "000.000.000...000.
.0.0...0.0.0.....0
......0.......0...
"
    @debrailler = Debrailler.new(message)
  end

  def test_braille_compiler
    expected = "000.000.000...000.
.0.0...0.0.0.....0
......0.......0...
"

    assert_equal expected, @debrailler.braille_in
  end

  def test_braille_reverter
    expected = ["000.000.000...000.", ".0.0...0.0.0.....0", "......0.......0..."]

    assert_equal expected, @debrailler.braille_reverter
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

  def test_reverse_keys

    assert_equal [["..", "..", ".."], " "], @debrailler.reverse_txt.first
  end

  def test_reverse_num

    assert_equal [[".0", ".0", "00"], "#"], @debrailler.reverse_num.first
  end

  def test_reverting_to_letters
    @debrailler.braille_reverter
    @debrailler.braille_output
    expected = "decode me"
    assert_equal expected, @debrailler.to_char
  end
end
