require './test/test_helper'
require './lib/night_writer'

class NightWriterTest < MiniTest::Test

  def setup
    @night_writer = NightWriter.new
    @night_writer.stubs(:reader).returns(FileReadWrite)
  end

  def test_reader

    assert_equal FileReadWrite, @night_writer.reader.class
  end
end
