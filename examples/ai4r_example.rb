require 'ai4r'
require 'irb'
require 'ostruct'

class ReplaceLightingFixturesRule

  def self.decision_tree
    if @id3_tree.nil?
      dataset = Ai4r::Data::DataSet.new
      dataset.load_csv_with_labels(File.join(File.dirname(__FILE__), "light_fixtures_complete.csv"))
      @id3_tree = Ai4r::Classifiers::ID3.new.build(dataset)
    end
    @id3_tree
  end

  def self.evaluate(property)
    decision_tree.eval property
  end
end


ExampleData = OpenStruct.new({
  screw_in_cfl: ["Screw-in CFL", "< 10 yrs ago"],
  pin_based_fluorescent: ["Pin-based fluorescent", ">= 10 yrs ago"],
  idk_old: ["Don't Know", ">= 10 yrs ago"],
  idk_new: ["Don't Know", "< 10 yrs ago"]
})

IRB.start