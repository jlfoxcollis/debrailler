require './test/test_helper'
require './lib/char_braille'

class CharBrailleTest < MiniTest::Test

  def test_it_exists
    row = {"char" => "a", "line_one" => "0.", "line_two" => "..", "line_three" => ".."}
    number = CharBraille.new(row)

    assert_instance_of CharBraille, number
    assert_equal "a", number.char
    assert_equal ["0.", "..", ".."], number.braille
  end
end
