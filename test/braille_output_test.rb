require './test/test_helper'
require './lib/braille_converter'
require './lib/braille_output'

class BrailleOutputTest < MiniTest::Test

  def setup
    message = [["00", ".0", ".."], ["0.", ".0", ".."],
                ["00", "..", ".."], ["0.", ".0", "0."],
                ["00", ".0", ".."], ["0.", ".0", ".."],
                ["..", "..", ".."], ["00", "..", "0."],
                ["0.", ".0", ".."]]

    @brailleoutput = BrailleOutput.new(message)
  end

  def test_line_one
    expected = "000.000.000...000."
    assert_equal expected, @brailleoutput.line_one
  end

  def test_line_two
    expected = ".0.0...0.0.0.....0"
    assert_equal expected, @brailleoutput.line_two
  end

  def test_line_three
    expected = "......0.......0..."
    assert_equal expected, @brailleoutput.line_three
  end

  def test_braille_output
    expected = "000.000.000...000.\n.0.0...0.0.0.....0\n......0.......0...\n"

    assert_equal expected, @brailleoutput.file_output
  end
end
