require 'grammar_stats'

RSpec.describe "GrammarStats class" do 

  it "fails" do
    grammar_stats = GrammarStats.new
    expect { grammar_stats.check("") }.to raise_error "Not a sentence."
  end

  context "given a string" do
    it "returns true if text begins with a capital letter and ends with punctuation" do
      grammar_stats = GrammarStats.new
      expect(grammar_stats.check("The quick brown fox.")).to eq true
      expect(grammar_stats.check("The quick brown fox!")).to eq true
      expect(grammar_stats.check("the quick brown fox.")).to eq false
      expect(grammar_stats.check("The quick brown fox")).to eq false
    end
  end

  context "given a string to check for capitalization and punctuation" do
    it "returns as an integer the percentage of texts checked that passed" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("The quick brown fox")
      grammar_stats.check("the quick brown fox.")
      grammar_stats.check("The quick brown fox!")
      grammar_stats.check("The quick brown fox.")
      expect(grammar_stats.percentage_good).to eq 50
    end
  end
end