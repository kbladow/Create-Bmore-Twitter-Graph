#Open file and read in.
nodes = File.open("nodes_with_ids.csv", 'r')
edges_with_ids = File.open("results.csv", 'r')
edges = File.open("original_assignment.csv", 'w')
namesAndIds = Hash.new

nodes.readlines("\n").each {|x| 
  id = x[0,4]
  name = x[5, x.length].chomp!
  namesAndIds[id] = name
}

edges_with_ids.readlines("\n").each {|y| 
  namesAndIds.each do |ids,names|
    if(y.include? "#{ids},")
      y.gsub!(/#{ids},/, "#{names},")
    end
  end
  edges.write(y)
}



nodes.close()
edges_with_ids.close()
edges.close()