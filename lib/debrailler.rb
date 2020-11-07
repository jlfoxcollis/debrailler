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
    braille_in.flat_map do |line|
      line.chomp
    end.join
  end

  def braille_reverter
    compiled = compiler
    length = ((compiler.length - 1) /3 )
    @line_one << compiled.slice!(0..length)
    # @line_one.slice!(-1)
    @line_two << compiled.slice!(0..length)
    # @line_two.slice!(-1)
    @line_three << compiled.slice!(0..length)
    # @line_three.slice!(-1)
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
        # require 'pry'; binding.pry
        a = reverse_txt[match]
        keeps << a.upcase
      elsif match ==  [".0", ".0", "00"]
        nums << match
      elsif !nums.empty? && match == ["..", "..", ".."]
        nums.clear
        keeps << @braille.txt.key(match)
      elsif !nums.empty?
        keeps << @braille.num.key(match)
      else
        keeps << @braille.txt.key(match)
      end
    end
    keeps.join
  end
end
