require 'csv'

class FileReadWrite

  def read
    file_in = ARGV[0]
    File.readlines(file_in)
  end

  def write(verter)
    file_out = ARGV[1]
    File.open(file_out, 'w') {|output| output.write(verter)}
  end

  def from_csv(location)
    CSV.read(location, headers: true)
  end
end
