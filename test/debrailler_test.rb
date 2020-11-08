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
    expected = "000.000.000...000..0.0...0.0.0.....0......0.......0..."

    assert_equal expected, @debrailler.compiled
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

  def test_file_creation
    @debrailler.more_or_less
    @debrailler.braille_output
    expected = "decode me"
    assert_equal expected, @debrailler.file_creation
  end
end
