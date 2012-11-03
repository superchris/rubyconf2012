require 'decisiontree'
require 'csv'
require 'ostruct'
require 'irb'

def build_tree(file, config)
  data = CSV.parse(File.read(file))
  labels = data.shift
  labels.pop
  data = data.collect { |row| row.collect { |cell| cell =~ /^\d+/ ? cell.to_i : cell } }
  tree = DecisionTree::ID3Tree.new(labels, data, "not recommended", config)
  tree.train
  tree
end

Tree = build_tree(ENV["FILE"] || File.join(File.dirname(__FILE__), "light_fixtures_continuous.csv"),
    lighting_type: :discrete, last_replaced: :continuous)

ExampleData = OpenStruct.new screw_in_cfl: ["Screw-in CFL", 1995],
  pin_based_fluorescent: ["Pin-based fluorescent", 2005],
  idk_old: ["Don't Know", 2000],
  idk_new: ["Don't Know", 2009]

IRB.start
