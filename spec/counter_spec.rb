require 'counter'

RSpec.describe Counter do
  it "counts from 0 onwards" do
    counter = Counter.new
    counter.add(5)
    expect(counter.report).to eq "Counted to 5 so far." 
  end
end