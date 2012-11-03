require 'pry'
require 'csv'

def parse_cuke(file)
  require 'cucumber'
  rules = Cucumber::Ast::Table.parse(File.read(file), "", 0).raw
end

task :ai4r_id3_rules do
  require 'ai4r'
  dataset = Ai4r::Data::DataSet.new(data_items: rules, data_labels: labels)
  puts Ai4r::Classifiers::ID3.new.build(dataset).get_rules
end

task :decision_tree_rules do
  require 'decisiontree'
  require 'cucumber'
  require 'graphr'
  rules = CSV.parse(File.read(ENV["FILE"]))
  labels = rules.shift
  labels.pop
  tree = DecisionTree::ID3Tree.new(labels, rules, "not recommended", :discrete)
  tree.train
  tree.graph("tree")
  binding.pry
end

task :cuke2csv do
  require 'csv'
  parse_cuke(ENV["FILE"]).each { |a| puts a.to_csv }
end

task :csv2table do
  data = CSV.parse(File.read(ENV["FILE"]))
  puts "<table><tr>"
  headers = data.shift
  headers.each {|h| puts "<th>#{h}</th>" }
  puts "</tr>"
  data.each do |row|
    puts "<tr>"
    row.each {|cell| puts "<td>#{cell}</td>" }
    puts "</tr>"
  end
  puts "</table>"
end
