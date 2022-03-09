require 'counter'

RSpec.describe Counter do
  it "initially reports 0" do
    counter = Counter.new
    expect(counter.report).to eq "Counted to 0 so far." 
  end

	it "reports a count of added values with each addition" do
	  counter = Counter.new
		counter.add(7)
	  expect(counter.report).to eq "Counted to 7 so far." 
	end

	it "reports a count of all added values" do
	  counter = Counter.new
		counter.add(7)
		counter.add(5)
		counter.add(6)
	  expect(counter.report).to eq "Counted to 18 so far." 
	end
end