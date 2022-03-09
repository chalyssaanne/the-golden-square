require 'string_builder'

RSpec.describe StringBuilder do
  it "creates a string, where strings can be added on" do
    string_builder = StringBuilder.new()
    string_builder.add("hello")
    result = string_builder.output
    expect(result).to eq "hello"
  end

  it "counts the length of the string" do
    string_builder_2 = StringBuilder.new
    string_builder_2.add("goodbye")
    result = string_builder_2.size
    expect(result).to eq 7
  end

end