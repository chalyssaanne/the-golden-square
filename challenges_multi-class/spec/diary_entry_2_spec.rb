require 'diary_entry_2'

RSpec.describe "DiaryEntry" do
  
  it "constructs" do
    diary_entry = DiaryEntry.new("Day 1", "Today it was sunny.")
    expect(diary_entry.title).to eq "Day 1"
    expect(diary_entry.contents).to eq "Today it was sunny."
  end

  describe "#count_words" do
    it "counts the total number of words for the content" do
      diary_entry = DiaryEntry.new("Day 1", "Today it was sunny.")
      expect(diary_entry.count_words).to eq 4
    end
  end

  context "given the wpm of a user" do
    it "gives an integer as the estimated reading time in minutes for the user to read the contents" do
      diary_entry = DiaryEntry.new("Day 1", "Today it was sunny but yesterday it was raining heavily.")
      expect(diary_entry.reading_time(2)).to eq 5
    end
  end  

  context "given 0 as the wpm of a user" do
    it "fails" do
      diary_entry = DiaryEntry.new("Day 1", "Today it was sunny.")
      expect { diary_entry.reading_time(0) }.to raise_error "WPM must be a positive number."
      expect { diary_entry.reading_chunk(0, 5) }.to raise_error "WPM must be a positive number."
    end
  end  

  context "given 0 minutes to read the content" do
    it "fails" do
      diary_entry = DiaryEntry.new("Day 1", "Today it was sunny.")
      expect { diary_entry.reading_chunk(2, 0) }.to raise_error "No time to read."
    end
  end  

  context "given the wpm of a user and the time they have to read the contents" do
    it "returns a string of the chunk of content the user could read in the given time" do
      diary_entry = DiaryEntry.new("Day 1", "Today it was sunny but yesterday it was raining heavily.")
      expect(diary_entry.reading_chunk(2, 4)).to eq "Today it was sunny but yesterday it was"
    end
  end 
  
  context "when reading_chunk is run again" do
    it "returns the next chunk of text skipping what's already been read" do
      diary_entry = DiaryEntry.new("Day 1", "Today it was sunny but yesterday it was raining heavily.")
      expect(diary_entry.reading_chunk(2, 4)).to eq "Today it was sunny but yesterday it was"
      expect(diary_entry.reading_chunk(2, 4)).to eq "raining heavily."
    end
  end 
  
  context "when content is fully read and reading_chunk is run again" do
    it "restarts the content reading" do
      diary_entry = DiaryEntry.new("Day 1", "Today it was sunny but yesterday it was raining heavily.")
      expect(diary_entry.reading_chunk(2, 4)).to eq "Today it was sunny but yesterday it was"
      expect(diary_entry.reading_chunk(2, 4)).to eq "raining heavily."
      expect(diary_entry.reading_chunk(2, 4)).to eq "Today it was sunny but yesterday it was"
    end
  end 
end