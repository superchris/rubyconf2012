require 'decisiontree'
require 'csv'

def build_tree(file, config)
  data = CSV.parse(File.read(file))
  labels = data.shift
  labels.pop
  data = data.collect { |row| row.collect { |cell| cell =~ /^\d+/ ? cell.to_i : cell } }
  tree = DecisionTree::ID3Tree.new(labels, data, "not recommended", config)
  tree.train
  tree
end
