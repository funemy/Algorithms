#generalize the graph into an array
def read_from_file()
  inputGraph = []
  File.open "kargerMinCut.txt" do |file|
    while line = file.gets
      line = line.chop.split /\t/
      line = line.map do |i|
        i.to_i
      end
      inputGraph.push line
    end
  end
  inputGraph
end

#input the vertex number of the graph
def minCut(graph, size)
  cross = 0
  contraction graph, size
  #the size of the graph has decreased by 1
  #stop recursing when there is only two vertices left
  if size - 1 > 2
    # puts "graph #{graph}"
    cross = minCut graph, size - 1
  end
  if size == 3
    for i in graph[0][1..-1]
      if graph[1].include? i
        cross += 1
      end
    end
  end
  cross
end

def contraction(graph, size)
  #randomly get a vertex which is not the last one
  #to contract with the last vertex
  v1 = rand size
  length_of_v1 = graph[v1].length
  row_num_of_v1 = graph[v1][0]
  index = rand length_of_v1
  v2 = graph[v1][index]
  while index == 0 or v2 == v1
    index = rand length_of_v1
    v2 = graph[v1][index]
  end
  # puts "v1=#{v1}"
  # puts "index=#{index}"
  # puts "v2=#{v2}"
  # puts graph[v1].inspect

  for l in graph
    if l[0] == v2
      line = l
      break
    end
  end
  # puts "line=#{line.inspect}"
  for i in line[1..-1]
    if i != graph[v1][0]
      graph[v1].push i
    end
  end

  graph[v1].delete line[0]
  graph.delete line
  graph.collect! do |l|
    l.collect! do |i|
      if i == line[0]
        i = row_num_of_v1
      else
        i
      end
    end
  end
  # puts "graph #{graph}"
end

for i in 1..100
  inputGraph = read_from_file()
  puts minCut inputGraph, 200
end
