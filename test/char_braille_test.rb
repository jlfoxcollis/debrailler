require './test/test_helper'
require './lib/char_braille'

class CharBrailleTest < MiniTest::Test

  def test_it_exists
    number = CharBraille.new("2", ["0.", "0.", ".."])

    assert_instance_of CharBraille, number
    assert_equal "2", number.char
    assert_equal ["0.", "0.", ".."], number.braille
  end
end
