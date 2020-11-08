require './test/test_helper'
require './lib/debrailler'
require './lib/text_output'

class TextOutputTest < MiniTest::Test

  def setup
    @message = [["00", ".0", ".."],
                ["0.", ".0", ".."],
                ["00", "..", ".."],
                ["0.", ".0", "0."],
                ["00", ".0", ".."],
                ["0.", ".0", ".."],
                ["..", "..", ".."],
                ["00", "..", "0."],
                ["0.", ".0", ".."]]

    @text_output = TextOutput.new(@message)
  end

  def test_it_exists

    assert_instance_of TextOutput, @text_output
    assert_equal Library, @text_output.braille.class
    assert_equal @message, @text_output.data
  end

  def test_file_output_and_word_wrap

    assert_equal "decode me", @text_output.file_output
  end
end
