require_relative './compiler_mod'
require_relative './text_output'

class Debrailler
  include Compiler
  attr_reader :compiled_braille,
              :line_one,
              :line_two,
              :line_three,
              :compiled

  def initialize(braille_in)
    @line_one = ""
    @line_two = ""
    @line_three = ""
    @compiled_braille = []
    @compiled = compiler(braille_in).join
  end

  def more_or_less
    @compiled.gsub("\n", "..")
    until @compiled.length == 0
      if @compiled.length >= 243
        braille_reverter_over_80
      elsif @compiled.length < 243
        braille_reverter
      end
    end
  end

  def braille_reverter
    lngth = ((@compiled.length - 1) / 3 )
    @line_one << @compiled.slice!(0..lngth)
    @line_two << @compiled.slice!(0..lngth)
    @line_three << @compiled.slice!(0..lngth)
    @line_one.slice!(-1)
    @line_two.slice!(-1)
    @line_three.slice!(-1)
  end

  def braille_reverter_over_80
    @line_one << @compiled.slice!(0..80)
    @line_two << @compiled.slice!(0..80)
    @line_three << @compiled.slice!(0..80)
    @line_one.slice!(-1)
    @line_two.slice!(-1)
    @line_three.slice!(-1)
    # @line_one.gsub!("\n", "..")
    # @line_two.gsub!("\n", "..")
    # @line_three.gsub!("\n", "..")
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
    file.file_output
  end
end
