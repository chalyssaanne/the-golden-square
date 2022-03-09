require 'greet'

RSpec.describe "greet method" do
  it "prints name to return 'Hello, #{name}'" do
    result = greet("Chalyssa")
    expect(result).to eq "Hello, Chalyssa"
  end
end
