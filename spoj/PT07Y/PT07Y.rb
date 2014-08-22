class Graph

  def initialize(adj)
    @adj = adj
    @visited = []
  end

  def is_tree?(node=0, prev=nil)
    @visited << node
    adjacent(node, prev).each do |a|
      return false if @visited.include? a
      return false unless is_tree?(a, node)
    end

    if node == 0 && @visited.size < @adj.size
      return false
    end

    return true
  end

  private
    def adjacent(node, prev)
      adj = []
      @adj[node].each.with_index do |v, i|
        adj << i if (v && i != prev && i != node)
      end
      return adj
    end
end

if __FILE__ == $0
  N, M = STDIN.gets.strip.split.map { |val| val.to_i }
  adj = Array.new(N+1) { Array.new(N+1, false) }
  (1..M).each do |i|
    p, q = STDIN.gets.strip.split.map { |val| val.to_i }
    adj[p][q] = true
  end

  graph = Graph.new(adj)
  puts graph.is_tree? ? "YES" : "NO"
end
