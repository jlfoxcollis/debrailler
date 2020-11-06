require_relative './braille_data'

class BrailleConverter
  attr_reader :text_in, :text_out, :braille

  def initialize(text_in)
    @braille = BrailleData.new
    @text_in = text_in
    @text_out = []
  end

  def doc_char #
    text_in.chars
  end

  def braille_converter
    doc_char.map do |char|
      braille.txt[char]
    end
  end

  def line_one
    braille_converter.flat_map do |char|
      char[0]
    end
  end

  def line_two
    braille_converter.flat_map do |char|
      char[1]
    end
  end

  def line_three
    braille_converter.flat_map do |char|
      char[2]
    end
  end


  def braille_output
    doc_char
  end


end
