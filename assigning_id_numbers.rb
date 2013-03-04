#Open file and read in.
nodes = File.open("nodes_with_ids.csv", 'r')
edges = File.open("edges.csv", 'r')
edges_with_ids = File.open("results.csv", 'w')
namesAndIds = Hash.new

nodes.readlines("\n").each {|x| 
  id = x[0,4]
  name = x[5, x.length].chomp!
  namesAndIds[id] = name
}

edges.readlines("\n").each {|y| 
  namesAndIds.each do |ids,names|
    if(y.include? "#{names},")
      y.gsub!(/#{names},/, "#{ids},")
    end
  end
  edges_with_ids.write(y)
}



nodes.close()
edges.close()
edges_with_ids.close()