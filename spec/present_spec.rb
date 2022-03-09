require 'present'

RSpec.describe Present do
  it "wraps and unwraps a value" do
    present = Present.new
    present.wrap("airpods")
    expect(present.unwrap).to eq "airpods"
  end

  it "fails if we unwrap without wrapping first" do
    present = Present.new
    expect { present.unwrap }.to raise_error "No contents have been wrapped."
  end

  it "fails if content has already been wrapped" do
    present = Present.new
    present.wrap("airpods")
    expect { present.wrap("airpods") }.to raise_error "A contents has already been wrapped."
  end
end