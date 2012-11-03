require 'decision_table'
require 'csv'
require 'ostruct'
require 'irb'

rule_data = CSV.parse(File.read(File.join(File.dirname(__FILE__), "simplified_space_heating.csv")))
Ruleset = DecisionTable::Ruleset.new(rule_data)

ExampleData = OpenStruct.new({
    gas_furnace_efficient: OpenStruct.new({type: "Gas central furnace", cgf_efficiency: "More than 78% AFUE"}),
    gas_furnace_inefficient: OpenStruct.new({type: "Gas central furnace", cgf_efficiency: "78% AFUE or lower"}),
    idk_old: OpenStruct.new({type: "Don't Know", constructed: "<= 1978"}),
    idk_new: OpenStruct.new({type: "Don't Know", constructed: ">= 1979"})
  })
IRB.start