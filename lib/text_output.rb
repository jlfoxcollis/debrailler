require_relative './library'

class TextOutput
  attr_reader :data, :braille

  def initialize(data)
    @braille = Library.new
    @data = data
    @data_out = []
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
        a = @braille.txt(match)
        keeps << a.upcase
      elsif match ==  [".0", ".0", "00"]
        nums << match
      elsif !nums.empty? && match == ["..", "..", ".."]
        nums.clear
        keeps << @braille.txt(match)
      elsif !nums.empty?
        keeps << @braille.num(match)
      else
        keeps << @braille.txt(match)
      end
    end
    ongoing = keeps.join
    word_wrap(ongoing)
  end

  def word_wrap(ongoing)
    until ongoing.length == 0
      @data_out << ongoing.slice!(0..79) + "\n"
    end
    @data_out.join.chomp
  end
end
