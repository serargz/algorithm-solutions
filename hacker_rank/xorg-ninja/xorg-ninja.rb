MOD = (10**9 + 7)

t = STDIN.gets.strip.to_i
t.times do
  n = STDIN.gets.strip.to_i
  ar = STDIN.gets.strip.split(" ").map { |num| num.to_i }

  ors = 0
  ar.each do |v|
    ors |= v
  end

  ret = 1
  for i in (1..n-1)
    ret = (ret*2) % MOD
  end
  
  puts ret*ors % MOD
end
