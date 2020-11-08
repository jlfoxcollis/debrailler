class SuperConverter

  def compiler(text_in)
    text_in.flat_map do |line|
      line.chomp.chars
    end
  end

end
