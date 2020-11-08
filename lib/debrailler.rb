require_relative './braille_data'
require_relative './compiler_mod'
require_relative './text_output'

class Debrailler
  include Compiler
  attr_reader :braille_in,
              :compiled_braille

  def initialize(braille_in)
    @braille_in = braille_in
    @text_out = []
    @line_one = ""
    @line_two = ""
    @line_three = ""
    @compiled_braille = []
    @compiled = compiler(braille_in).join
  end

  def more_or_less
    until @compiled.length == 0
      if @compiled.length >= 240
        braille_reverter_over_80
      elsif @compiled.length < 240
        braille_reverter
      end
    end
  end

  def braille_reverter
    lngth = ((@compiled.length - 1) / 3 )
    @line_one << @compiled.slice!(0..lngth)
    @line_two << @compiled.slice!(0..lngth)
    @line_three << @compiled.slice!(0..lngth)
  end

  def braille_reverter_over_80
    @line_one << @compiled.slice!(0..79)
    @line_two << @compiled.slice!(0..79)
    @line_three << @compiled.slice!(0..79)
  end

  def braille_output
    one = @line_one
    two = @line_two
    three = @line_three
    until one.length == 0
      compiled_lines = []
      compiled_lines << one.slice!(0..1)
      compiled_lines << two.slice!(0..1)
      compiled_lines << three.slice!(0..1)
      @compiled_braille << compiled_lines
    end
    @compiled_braille
  end

  def file_creation
    file = TextOutput.new(compiled_braille)
  end
end
