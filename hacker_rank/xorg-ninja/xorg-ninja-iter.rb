# This method is NOT optimal, only for reference

MOD = (10**9 + 7)

t = STDIN.gets.strip.to_i
t.times do
  n = STDIN.gets.strip.to_i
  ar = STDIN.gets.strip.split(" ").map { |num| num.to_i }

  mem = {}
  sum = 0
  ar.each_with_index do |v, i|
    mem[i.to_s] = v
    sum += v
  end

  for i in (1...n)
    tmp = {}
    mem.each do |k,v|
      last = k.split().last.to_i
      next if last >= n-1
      for j in (last+1...n)
        k2 = k + " #{j}"
        tmp[k2] = mem[k] ^ ar[j]
        sum += tmp[k2]
      end
    end
    mem = tmp
  end
  
  puts sum % MOD
end
