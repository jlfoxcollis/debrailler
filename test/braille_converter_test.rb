require './test/test_helper'
require './lib/braille_converter'

class DebraillerTest < MiniTest::Test

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
end
