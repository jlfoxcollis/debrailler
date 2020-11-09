require_relative './braille_converter'
require_relative './file_reader'

class NightWriter
  attr_reader :reader, :converter

  def initialize
    @reader = FileReadWrite.new
    @converter = converter
  end

  def read_file
    plain = @reader.read
    braille = encode_to_braille(plain)
  end

  def encode_to_braille(plain)
    @converter = BrailleConverter.new(plain)
    converter.braille_converter
    output = converter.file_creation
    create_braille_file(output)
  end

  def create_braille_file(output)
    @reader.write(output)
    output_message
  end

  def output_message
    puts "Created #{ARGV[1]} containing #{@converter.compile.length} characters."
  end
end

night_writer = NightWriter.new
night_writer.read_file
