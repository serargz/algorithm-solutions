n = 100
k = 100

$m = Array.new(n+1) { Array.new(k+1, 0) }
$m[0][0] = 1
$m[1][0] = 2

for j in (2..n)
  $m[j][0] = $m[j-1][0] + $m[j-2][0]
end

for i in (1..k)
  for j in (2..n)
    $m[j][i] = $m[j-1][i] + $m[j-2][i] + $m[j-1][i-1] - $m[j-2][i-1]
  end
end

P = STDIN.gets.strip.to_i
for i in (1..P)
  a, b, c = STDIN.gets.strip.split(" ").map{|v| v.to_i}
  puts "#{a} #{$m[b][c]}"
end