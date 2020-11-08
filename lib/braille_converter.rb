require_relative './library'
require_relative './compiler_mod'
require_relative './braille_output'

class BrailleConverter
  include Compiler
  attr_reader :text_in, :text_out, :braille, :compile

  def initialize(text_in)
    @braille = Library.new
    @text_in = text_in
    @compile = compiler(text_in)
  end

  def braille_converter
    compiled = []
    number = []
    @compile.each do |char|
      if char == "\n"
        char.replace(" ")
      end
    end
    @compile.each do |char|
      if char === char.capitalize && ("A".."Z").to_a.include?(char) then
        compiled << braille.txt(:caps)
        compiled << braille.txt(char.downcase)
      elsif char == " " && !number.empty?
        number.clear
        compiled << braille.txt(char)
      elsif braille.valid_num?(char) && number.empty?
        compiled << braille.num("#")
        number << "#"
        compiled << braille.num(char)
      elsif braille.valid_num?(char) && !number.empty?
        compiled << braille.num(char)
      else
        compiled << braille.txt(char)
      end
    end
    compiled
  end

  def file_creation
    file = BrailleOutput.new(braille_converter)
    file.file_output
  end
end
