require 'diary_2'
require 'diary_entry_2'

RSpec.describe "integration" do

  context "when we add a diary entry to the Diary" do
    it "adds the diary entry in the list" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("Day 1", "Today it was sunny.")
      diary_entry_2 = DiaryEntry.new("Day 1", "Today it was cloudy.")
      diary.add(diary_entry)
      diary.add(diary_entry_2)
      expect(diary.all).to eq [diary_entry, diary_entry_2]
    end
  end

   describe "#total_word_count" do
    it "returns the total number of words in all diary entries" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("Day 1", "Today it was sunny.")
      diary_entry_2 = DiaryEntry.new("Day 2", "Today it was cloudy.")
      diary.add(diary_entry)
      diary.add(diary_entry_2)
      expect(diary.total_word_count).to eq 8
    end
  end

  describe "#total_reading_time" do
    it "returns the estimated time for the user to read all content at the given wpm" do
      diary = Diary.new
      diary_entry = DiaryEntry.new("Day 1", "Today it was sunny.")
      diary_entry_2 = DiaryEntry.new("Day 2", "Today it was cloudy.")
      diary.add(diary_entry)
      diary.add(diary_entry_2)
      expect(diary.total_reading_time(2)).to eq 4
    end

    context "given 0 as the wpm of a user" do
      it "fails" do
        diary = Diary.new
        diary_entry = DiaryEntry.new("Day 1", "Today it was sunny.")
        diary.add(diary_entry)
        expect { diary.total_reading_time(0) }.to raise_error "WPM must be a positive number."
      end
    end  
  end

  describe "best reading time entry behaviour " do
    context "where we just have one entry and it is readable in time" do
      it "returns that entry" do
        diary = Diary.new
        diary_entry = DiaryEntry.new("Day 1", "Today it was sunny.")
        diary.add(diary_entry)
        result = diary.find_best_entry_for_reading_time(2, 2)
        expect(result).to eq diary_entry  
      end
    end

    context "where we just have one entry and it is not readable in time" do
      it "returns nil" do
        diary = Diary.new
        diary_entry = DiaryEntry.new("Day 1", "Today it was sunny.")
        diary.add(diary_entry)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq nil
      end
    end

    context "where we have multiple entries to sort from" do
      it "returns the longest entry that can be read by the user in the given time" do
        diary = Diary.new
        diary_entry = DiaryEntry.new("Day 1", "Today")   #user can read - but not best entry to read as there is a longer readable diary_entry
        diary_entry_2 = DiaryEntry.new("Day 2", "Raining again")   #user can read - longer readable diary entry - best entry to read 
        diary_entry_3 = DiaryEntry.new("Day 3", "Today was okay.")   #user can't read - too long
        diary_entry_4 = DiaryEntry.new("Day 3", "Today was still raining.")   #user can't read - too long
        diary.add(diary_entry)      #order of the test entries matter, because the `readable_entries.first` gets the first readable entry.
        diary.add(diary_entry_2)
        diary.add(diary_entry_3)
        diary.add(diary_entry_4)
        result = diary.find_best_entry_for_reading_time(2, 1)
        expect(result).to eq diary_entry_2
      end
    end
  end

end