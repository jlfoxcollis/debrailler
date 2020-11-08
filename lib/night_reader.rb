require_relative './debrailler'
require_relative './file_reader'

class NightReader
  attr_reader :reader, :reverter

  def initialize
    @reader = FileReadWrite.new
  end

  def read_braille
    braille = @reader.read
    plain = decode_to_text(braille)
  end

  def decode_to_text(braille)
    @reverter = Debrailler.new(braille)
    reverter.more_or_less
    reverter.braille_output
    require 'pry'; binding.pry
    output = create_text_file(reverter)
  end

  def create_text_file(reverter)
    new_plain = @reader.write(reverter)
    output_message
  end

  def output_message
    puts "Created #{ARGV[1]} containing #{reverter.braille_output.length} characters."
  end
end


debrailler = NightReader.new
debrailler.read_braille
