require 'diary'

RSpec.describe Diary do
  
  it "returns ... if more than five words" do
    diary = Diary.new

    expect(diary.make_snippet("one two three four five six")).to eq "one two three four five..."
  end

  it "returns the words without ... if less than five words" do
   diary = Diary.new 

   expect(diary.make_snippet("one two three")).to eq "one two three"
  end

  it "returns the number of words in the string" do
    diary = Diary.new
    expect(diary.count_words("one two three four")).to eq 4
  end

end

=begin
  it "takes a string as an argument" do
    diary = Diary.new

    expect(diary.make_snippet("hello")).to eq "hello"
  end
=end

=begin
  it "returns the first five words" do
    diary = Diary.new

    expect(diary.make_snippet("one two three four five six")).to eq "one two three four five"
    expect(diary.make_snippet("seven eight nine ten eleven twelve")).to eq "seven eight nine ten eleven"
  end
=end

=begin
  it "splits the string into an array" do
    diary = Diary.new

    expect(diary.make_snippet("one two three four five six")).to eq ["one", "two", "three", "four", "five", "six"]
  end
=end

=begin
  it "returns a string as an argument" do
      diary = Diary.new
      expect(diary.count_words("one two three four")).to eq "one two three four"
    end
=end