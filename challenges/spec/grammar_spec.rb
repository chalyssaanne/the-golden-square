require 'grammar'

RSpec.describe "check_grammar method" do

  context "given an empty string" do
    it "fails" do
      expect { check_grammar("") }.to raise_error "Not a sentence."
    end
  end

  context "given a sentence with a capital letter and full stop" do
    it "returns true" do
      expect(check_grammar("Today it is raining.")). to eq true
    end
  end
  
  context "given a sentence without a capital letter" do
    it "returns false" do
      expect(check_grammar("today it is raining.")). to eq false
    end
  end

  context "given a sentence without a full stop" do
    it "returns false" do
      expect(check_grammar("Today it is raining")). to eq false
    end
  end

  context "given a sentence with neither a capital letter and full stop" do
    it "returns false" do
      expect(check_grammar("today it is raining")). to eq false
    end
  end

  context "given a sentence with an exclamation mark" do
    it "returns true" do
      expect(check_grammar("Today it is raining!")). to eq true
    end
  end

  context "given a sentence with a question mark" do
    it "returns true" do
      expect(check_grammar("Today it is raining?")). to eq true
    end
  end

  context "given a sentence ending with a comma" do
    it "returns false" do
      expect(check_grammar("Today it is raining,")). to eq false
    end
  end
end