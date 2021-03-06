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
    read = @reader.from_csv('./data/char.csv')
    read.each do |row|
      @letters << CharBraille.new(row)
    end
  end

  def create_numbers
    read = @reader.from_csv('./data/number.csv')
    read.each do |row|
      @numbers << CharBraille.new(row)
    end
  end

  def txt(character)
    @letters.select do |text|
      if text.char == character
        return text.braille
      elsif text.braille == character
        return text.char.to_s
      else
        false
      end
    end
  end

  def num(character)
    @numbers.select do |number|
      if number.char == character
        return number.braille
      elsif number.braille == character
        return number.char.to_s
      else
        false
      end
    end
  end

  def valid_text?(character)
    @letters.any? do |letter|
      letter.char == character || letter.braille == character
    end
  end

  def valid_num?(character)
    @numbers.any? do |number|
      number.char == character || number.braille == character
    end
  end
end
