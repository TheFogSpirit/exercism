class Hamming
  VERSION = 1

  def Hamming.compute(a, b)
    unless a.size == b.size
      raise ArgumentError.new("strands must be the same length")
    end

    a.chars.zip(b.chars).count {|(x, y)| x != y}
  end
end
