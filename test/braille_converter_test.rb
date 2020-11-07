require './test/test_helper'
require './lib/braille_converter'

class BrailleConverterTest < MiniTest::Test

  def setup
    message = "decode me"
    @brailleconv = BrailleConverter.new(message)
  end

  def test_it_exists

    assert_equal "decode me", @brailleconv.text_in
    assert_equal [], @brailleconv.text_out
  end

  def test_doc_char
    expected = ["d", "e", "c", "o", "d", "e", " ", "m", "e"]
    assert_equal expected, @brailleconv.doc_char
  end

  def test_braille_converter
    expected = [["00", ".0", ".."], ["0.", ".0", ".."],
                ["00", "..", ".."], ["0.", ".0", "0."],
                ["00", ".0", ".."], ["0.", ".0", ".."],
                ["..", "..", ".."], ["00", "..", "0."],
                ["0.", ".0", ".."]]
    assert_equal expected, @brailleconv.braille_converter
  end

  def test_line_one
    expected = "000.000.000...000."
    assert_equal expected, @brailleconv.line_one
  end

  def test_line_two
    expected = ".0.0...0.0.0.....0"
    assert_equal expected, @brailleconv.line_two
  end

  def test_line_three
    expected = "......0.......0..."
    assert_equal expected, @brailleconv.line_three
  end

  def test_caps
    message = "B2"
    brailleconv = BrailleConverter.new(message)

    expected = [["..", "..", ".0"], ["0.", "0.", ".."], [".0", ".0", "00"], ["0.", "0.", ".."]]
    assert_equal expected, brailleconv.braille_converter
  end

  def test_numbers
    message = "B20 20"
    brailleconv = BrailleConverter.new(message)
    expected = [["..", "..", ".0"], ["0.", "0.", ".."], [".0", ".0", "00"], ["0.", "0.", ".."],
                [".0", "00", ".."], ["..", "..", ".."], [".0", ".0", "00"], ["0.", "0.", ".."],
                [".0", "00", ".."]]
    assert_equal expected, brailleconv.braille_converter
  end

  def test_braille_output
    expected = "000.000.000...000.
.0.0...0.0.0.....0
......0.......0...
"
    assert_equal expected, @brailleconv.braille_output
  end
end
