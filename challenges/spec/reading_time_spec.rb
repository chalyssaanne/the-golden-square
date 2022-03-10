require 'reading_time'

RSpec.describe 'reading_time' do

  it "returns the estimated time it takes to read one word" do
  
    expect(reading_time("Today")).to eq "0.3 seconds"
  end

  it "returns the estimated time it takes to read a text" do
    expect(reading_time("")).to eq "0.0 seconds"
    expect(reading_time("Today it was sunny")).to eq "1.2 seconds"
  end

end

=begin
  it "takes a string as an argument" do
  
    expect(reading_time("Today it was raining")).to eq "Today it was raining"  
  end

  it "returns estimate of reading time of the given text" do

    expect(reading_time("Today it was raining")).to eq "5 seconds"
  end

  it "returns the number of words" do

    expect(reading_time("Today it was raining")).to eq 4
  end

=end
