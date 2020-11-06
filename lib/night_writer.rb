require './lib/braille_converter'

file_in = ARGV[0]
file_out = ARGV[1]

input_data = File.read(file_in).chomp

converter = BrailleConverter.new(input_data)

output = File.open(file_out, 'w')
output.write(converter.braille_output)

puts "Created #{file_out} containing #{converter.text_in.length} characters."
