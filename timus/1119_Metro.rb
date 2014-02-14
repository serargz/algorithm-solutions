h = Math.sqrt 20000
inf = 100*1000*2

n = 3
m = 2

dist = Array.new(n+1){ Array.new(m+1, inf) }
dist[1][1] = 0

dg = Array.new(n+1){ Array.new(m+1, false) }
dg[1][1] = true
dg[3][2] = true
dg[1][2] = true

i=2
while i<n+1 || i<m+1
  for k in (1..i+1)
    if(i<n+1 && k<m+1)
      dist[i][k] = [dist[i][k], dist[i-1][k] + 100, dist[i][k-1] + 100].min
      dist[i][k] = [dist[i][k], dist[i-1][k-1] + h].min if dg[i-1][k-1]
      puts "dist #{i}, #{k} >>> #{dist[i][k]}"
    end
    
    if(i<m+1 && k<n+1)
      dist[k][i] = [dist[k][i], dist[k-1][i] + 100, dist[k][i-1] + 100].min
      dist[k][i] = [dist[k][i], dist[k-1][i-1] + h].min if dg[k-1][i-1]
      puts "dist #{k}, #{i} >>> #{dist[k][i]}"
    end
  end
  i += 1
end

dist[n][m]
    
    
      
  








