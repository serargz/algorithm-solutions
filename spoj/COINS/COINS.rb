$m = {}
$m[0] = 0

def dp(n)
  return 0 if n==0
  return $m[n] unless $m[n].nil?

  sum = dp(n/2) + dp(n/3) + dp(n/4)
  $m[n] = [n, sum].max
end

loop do
  break if STDIN.eof?
  n = STDIN.gets.strip.to_i
  puts dp(n)
end