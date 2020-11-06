require './lib/debrailler'

file_in = ARGV[0]
file_out = ARGV[1]
reverter = Debrailler.new(File.read(file_in).chomp)
File.open(file_out, 'w') {|output| output.write(reverter.braille_output)}

puts "Created #{file_out} containing #{reverter.braille_in.length} characters."
