module Compiler

  def compiler(text_in)
    text_in.flat_map do |line|
      line.chars
    end
  end
end
