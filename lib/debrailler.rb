require_relative './braille_data'

class Debrailler
  attr_reader :braille_in, :compiled_braille, :line_one, :braille

  def initialize(braille_in)
    @braille = BrailleData.new
    @braille_in = braille_in
    @text_out = []
    @line_one = ""
    @line_two = ""
    @line_three = ""
    @compiled_braille = []
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

  def reverse_txt
    @braille.txt.invert
  end

  def reverse_num
    @braille.num.invert
  end

  def to_char
    keeps = []
    caps = []
    nums = []
    @compiled_braille.each do |match|
      if match == ["..", "..", ".0"]
         caps << match
      elsif !caps.empty?
        caps.clear
        keeps << reverse_num[match].capitalize
      elsif match ==  [".0", ".0", "00"]
        nums << match
      elsif !nums.empty?
        keeps << reverse_num[match]
      end
    end
    keeps.join
  end
end
