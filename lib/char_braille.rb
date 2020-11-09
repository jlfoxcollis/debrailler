class CharBraille
  attr_reader :char,
              :line_one,
              :line_two,
              :line_three,
              :braille

  def initialize(info)
    @char = info["char"]
    @line_one = info["line_one"]
    @line_two = info["line_two"]
    @line_three = info["line_three"]
  end

  def braille
    [line_one, line_two, line_three]
  end
end
