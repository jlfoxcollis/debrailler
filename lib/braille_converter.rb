require_relative './braille_data'
require_relative './compiler_mod'
require_relative './braille_output'

class BrailleConverter
  include Compiler
  attr_reader :text_in, :text_out, :braille, :compile

  def initialize(text_in)
    @braille = BrailleData.new
    @text_in = text_in
    @compile = compiler(text_in)
  end

  def braille_converter
    compiled = []
    num = []
    @compile.each do |char|
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

  def file_creation
    file = BrailleOutput.new(braille_converter)
    file.file_output
  end
end
