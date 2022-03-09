require 'gratitudes'

RSpec.describe Gratitudes do
  it "combines all gratitudes into a list" do
    gratitudes = Gratitudes.new
    gratitudes.add("A supportive family") 
    gratitudes.add("Health") 
    gratitudes.add("Food on our table")
    expect(gratitudes.format).to eq "Be grateful for: A supportive family, Health, Food on our table"
  end
end

#it "adds a gratitudes into an array" do
#  gratitudes = Gratitudes.new
#  gratitudes.add("A supportive family")
#  expect(gratitudes).to eq "A supportive family"
#end
