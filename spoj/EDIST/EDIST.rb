class Edist

  def initialize(a, b)
    @a = a
    @b = b
    @m = Array.new(@a.size+1) {Array.new(@b.size+1, -1)}

    for i in 0..@a.size
      @m[i][0] = i
    end

    for j in 0..@b.size
      @m[0][j] = j
    end
  end

  def ops(i, j)
    return j if i == 0
    return i if j == 0
    return @m[i][j] if @m[i][j] > -1

    if @a[i-1] == @b[j-1]
      @m[i][j] = [1+ops(i, j-1), 1+ops(i-1, j), ops(i-1, j-1)].min
    else
      
      @m[i][j] = [1+ops(i, j-1), 1+ops(i-1, j), 1+ops(i-1, j-1)].min
    end

    return @m[i][j]
  end

  def run
    ops(@a.size, @b.size)
  end
end

n = STDIN.gets.strip.to_i
n.times do
  a = STDIN.gets.strip
  b = STDIN.gets.strip
  puts Edist.new(a, b).run
end
