require_relative './braille_data'

class BrailleConverter
  attr_reader :text_in, :text_out, :braille

  def initialize(text_in)
    @braille = BrailleData.new
    @text_in = text_in
    @text_out = []
  end

  def doc_char
    text_in.flat_map do |line|
      line.chomp.chars
    end
  end

  def braille_converter
    compiled = []
    num = []
    doc_char.each do |char|
      if char === char.capitalize && ("A".."Z").to_a.include?(char) then
        compiled << braille.txt[:caps]
        compiled << braille.txt[char.downcase]
      elsif braille.num.include?(char) && num.empty?
        compiled << braille.num["#"]
        num << "#"
        compiled << braille.num[char]
      elsif braille.num.include?(char) && !num.empty?
        compiled << braille.num[char]
      elsif !braille.num.include?(char) && !num.empty?
        num.clear
        compiled << braille.txt[char]
        compiled << braille.txt[" "]
      elsif char == " "
        num.clear
        compiled << braille.txt[char]
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
    text_one = line_one
    text_two = line_two
    text_three = line_three
    until text_one.length == 0
      @text_out << text_one.slice!(0..79) + "\n"
      @text_out << text_two.slice!(0..79) + "\n"
      @text_out << text_three.slice!(0..79) + "\n"
    end
    @text_out.join
  end
end
