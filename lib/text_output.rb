require_relative './library'

class TextOutput
  attr_reader :data

  def initialize(data)
    @braille = Library.new
    @data = data
  end

  def file_output
    keeps = []
    caps = []
    nums = []
    @data.each do |match|
      if match == ["..", "..", ".0"]
         caps << match
      elsif !caps.empty?
        caps.clear
        keeps << @braille.txt.key(match).upcase
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
