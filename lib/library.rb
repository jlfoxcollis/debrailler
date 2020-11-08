require_relative './char_braille'
require_relative './file_reader'

class Library
  attr_reader :letters, :numbers, :reader

  def initialize
    @reader = FileReadWrite.new
    @letters = []
    @numbers = []
    create_text
    create_numbers
  end

  def create_text
    text.each do |char, braille|
      @letters << CharBraille.new(char, braille)
    end
  end

  def create_numbers
    number.each do |num, braille|
      @numbers << CharBraille.new(num, braille)
    end
  end

  def txt(character)
    @letters.select do |text|
      if text.char == character
        return text.braille
      elsif text.braille == character
        return text.char.to_s
      end
    end
  end

  def num(character)
    @numbers.select do |number|
      if number.char == character
        return number.braille
      elsif number.braille == character
        return number.char.to_s
      end
    end
  end

  def text
    {
      " " => ["..", "..", ".."],
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", "..", ".."],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", "0."],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => ["00", "00", "0."],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"],
      "!" => ["..", "00", "0."],
      "'" => ["..", "..", "0."],
      "," => ["..", "0.", ".."],
      "-" => ["..", "..", "00"],
      "." => ["..", "00", ".0"],
      "?" => ["..", "0.", "00"],
      caps: ["..", "..", ".0"]
    }
  end

  def number
    {
      "#" => [".0", ".0", "00"],
      "0" => [".0", "00", ".."],
      "1" => ["0.", "..", ".."],
      "2" => ["0.", "0.", ".."],
      "3" => ["00", "..", ".."],
      "4" => ["00", ".0", ".."],
      "5" => ["0.", ".0", ".."],
      "6" => ["00", "0.", ".."],
      "7" => ["00", "00", ".."],
      "8" => ["0.", "00", ".."],
      "9" => [".0", "0.", ".."],
      "!" => ["..", "00", "0."]
    }
  end
end
