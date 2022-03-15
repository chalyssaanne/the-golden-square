require 'tasks'

RSpec.describe "check_tasks method" do

  context "given an empty string" do
    it "fails" do
      expect { check_tasks("") }.to raise_error "No tasks found"
    end  
  end

  context "given text that contains @TODO" do
    it "returns true" do
      expect(check_tasks("@TODO wash the car")).to eq true
    end  
  end

  context "given text that doesn't contain @TODO" do
    it "returns false" do
      expect(check_tasks("Today it is raining")).to eq false
    end  
  end

end