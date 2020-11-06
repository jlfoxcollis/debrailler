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
    compiled = []
    doc_char.each do |char|
      if char === char.capitalize && ("A".."Z").to_a.include?(char) then
        compiled << braille.txt[:caps]
        compiled << braille.txt[char.downcase]
      else
        compiled << braille.txt[char.downcase]
      end
    end
    compiled
  end

  def line_one
    braille_converter.reduce("") do |final, char|
      final << char[0]
    end
  end

  def line_two
    braille_converter.reduce("") do |final, char|
      final << char[1]
    end
  end

  def line_three
    braille_converter.reduce("") do |final, char|
      final << char[2]
    end
  end

  def braille_output
    @text_out << line_one.slice!(0..79) + "\n"
    @text_out << line_two.slice!(0..79) + "\n"
    @text_out << line_three.slice!(0..79) + "\n"
    @text_out.join
  end
end
