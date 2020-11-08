require './test/test_helper'
require './lib/braille_converter'

class BrailleConverterTest < MiniTest::Test

  def setup
    message = ["decode me"]
    @brailleconv = BrailleConverter.new(message)
  end

  def test_it_exists

    assert_equal ["decode me"], @brailleconv.text_in
    assert_instance_of BrailleConverter, @brailleconv
    assert_equal Array, @brailleconv.text_in.class
    assert_equal Library, @brailleconv.braille.class
  end

  def test_doc_char
    expected = ["d", "e", "c", "o", "d", "e", " ", "m", "e"]

    assert_equal expected, @brailleconv.compile
  end

  def test_braille_converter
    expected = [["00", ".0", ".."], ["0.", ".0", ".."],
                ["00", "..", ".."], ["0.", ".0", "0."],
                ["00", ".0", ".."], ["0.", ".0", ".."],
                ["..", "..", ".."], ["00", "..", "0."],
                ["0.", ".0", ".."]]

    assert_equal expected, @brailleconv.braille_converter
  end

  def test_caps
    message = ["B2"]
    brailleconv = BrailleConverter.new(message)

    expected = [["..", "..", ".0"], ["0.", "0.", ".."], [".0", ".0", "00"], ["0.", "0.", ".."]]
    assert_equal expected, brailleconv.braille_converter
  end

  def test_numbers
    message = ["B20 20"]
    brailleconv = BrailleConverter.new(message)
    expected = [["..", "..", ".0"], ["0.", "0.", ".."], [".0", ".0", "00"],
                ["0.", "0.", ".."], [".0", "00", ".."], ["..", "..", ".."],
                [".0", ".0", "00"], ["0.", "0.", ".."], [".0", "00", ".."]]

    assert_equal expected, brailleconv.braille_converter
  end

  def test_file_creation
    expected = "000.000.000...000.
.0.0...0.0.0.....0
......0.......0...
"

    assert_equal expected, @brailleconv.file_creation
  end
end
