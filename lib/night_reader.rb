require './lib/debrailler'

file_in = ARGV[0]
file_out = ARGV[1]
reverter = Debrailler.new(File.readlines(file_in))
reverter.compiler
reverter.more_or_less
reverter.braille_output
File.open(file_out, 'w') {|output| output.write(reverter.to_char)}

puts "Created #{file_out} containing #{reverter.to_char.length} characters."
