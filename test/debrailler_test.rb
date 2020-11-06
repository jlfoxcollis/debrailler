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

end
