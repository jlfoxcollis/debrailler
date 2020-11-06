require_relative './braille_data'

class Debrailler
  attr_reader :braille_in

  def initialize(braille_in)
    @braille = BrailleData.new
    @braille_in = braille_in
    @text_out = []
    @line_one = ""
    @line_two = ""
    @line_three = ""
  end

  def compiler
    braille_in
  end

  def braille_reverter
    length = ((braille_in.length - 1) /3 )
    @line_one << compiler.slice!(0..length)
    @line_one.slice!(-1)
    @line_two << compiler.slice!(0..length)
    @line_two.slice!(-1)
    @line_three << compiler.slice!(0..length)
    @line_three.slice!(-1)
    [@line_one, @line_two, @line_three]
  end


  def braille_output

  end


end
