require 'check_codeword'

RSpec.describe "check_codeword method" do
  it "checks if codeword equals horse, return 'Correct! Come in.'" do
    result = check_codeword("horse")
    expect(result).to eq "Correct! Come in."
  end

  it "checks if the first character equals 'h' and if the last character equals 'e', return 'Close, but nope.'" do
    result = check_codeword("hirrse")
    expect(result).to eq "Close, but nope."
  end

  it "checks if codeword is not equal to 'horse' or if the first character does not equal 'h' and the last character does not equal 'e', return 'WRONG!'" do
    result = check_codeword("dog")
    expect(result).to eq "WRONG!"
  end
end