class BrailleConverter
  attr_reader :text_in, :text_out

  def initialize(text_in)
    @text_in = text_in
    @text_out = []
  end

  def doc_char
    text_in.chars
  end

  def braille_output
    doc_char
  end


end
