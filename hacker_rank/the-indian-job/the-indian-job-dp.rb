def time(i,s1,s2)
  return $m[i][[s1,s2]] if $m[i].has_key?([s1,s2])
  return false if s1 < 0 || s2 < 0
  return true if i < 0
  $m[i][[s1,s2]] = time(i-1, s1-$ar[i], s2) || time(i-1, s1, s2-$ar[i])
end

t = STDIN.gets.strip.to_i
t.times do
  n, g = STDIN.gets.strip.split().map { |num| num.to_i }
  $ar = STDIN.gets.strip.split().map { |num| num.to_i }
  $m = Array.new(100) { {} }
  puts time(n-2, g-$ar[n-1], g) ? "YES" : "NO"
end
