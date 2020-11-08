class BrailleOutput
  attr_reader :data, :data_out

  def initialize(data)
    @data = data
    @data_out = []
  end

  def line_one
    data.reduce("") do |final, char|
      final << char[0]
    end
  end

  def line_two
    data.reduce("") do |final, char|
      final << char[1]
    end
  end

  def line_three
    data.reduce("") do |final, char|
      final << char[2]
    end
  end

  def file_output
    text_one = line_one
    text_two = line_two
    text_three = line_three
    until text_one.length == 0
      @data_out << text_one.slice!(0..79) + "\n"
      @data_out << text_two.slice!(0..79) + "\n"
      @data_out << text_three.slice!(0..79) + "\n"
    end
    @data_out.join
  end
end
