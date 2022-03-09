require 'report_length'

RSpec.describe "report_length method" do
  it "prints the character length of the given string" do
    result = report_length("heavy")
    expect(result).to eq "This string was 5 characters long."
  end
end