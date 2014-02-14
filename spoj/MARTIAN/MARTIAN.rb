while true
  n,m = STDIN.gets.strip.split(" ").map { |i| i.to_i}

  break if n == 0

  y = []
  b = []

  n.times do
    y << STDIN.gets.strip.split(" ").map { |i| i.to_i }
  end

  n.times do
    b << STDIN.gets.strip.split(" ").map { |i| i.to_i }
  end

  ys = Array.new(n+1) {Array.new(m+1, 0)}
  bs = Array.new(n+1) {Array.new(m+1, 0)}

  for i in 1..n
    for j in 1..m
      tmp = [ys[i-1][j-1], bs[i-1][j-1]].max
      ys[i][j] = y[i-1][j-1] + ys[i][j-1] + [ys[i-1][j], bs[i-1][j]].max - tmp
      bs[i][j] = b[i-1][j-1] + bs[i-1][j] + [ys[i][j-1], bs[i][j-1]].max - tmp
    end
  end

  puts [ys[n][m], bs[n][m]].max
  
end
