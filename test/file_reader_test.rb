require './test/test_helper'
require './lib/file_reader'

class FileReadWriteTest < MiniTest::Test

  def setup
    @reader = FileReadWrite.new
    @reader.stubs(:read).returns("I have read into it!")
    @reader.stubs(:write).returns("text converted to braille")
  end

  def test_read

    assert_equal "I have read into it!", @reader.read
  end

  def test_write

    assert_equal "text converted to braille", @reader.write
  end
end
