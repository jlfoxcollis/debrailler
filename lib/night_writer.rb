require './lib/braille_converter'

file_in = ARGV[0]
file_out = ARGV[1]
converter = BrailleConverter.new(File.read(file_in).chomp)
File.open(file_out, 'w') {|output| output.write(converter.braille_output)}

puts "Created #{file_out} containing #{converter.text_in.length} characters."
