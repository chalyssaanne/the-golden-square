require 'diary_entry'

RSpec.describe "DiaryEntry class" do
  
  context "given 2 arguments of the title and contents" do
    it "returns the title and context" do
      diary_entry = DiaryEntry.new("title", "contents")
      expect(diary_entry.title).to eq "title"
      expect(diary_entry.contents).to eq "contents"
    end

    it "returns the number of words in the contents as an integer" do
      diary_entry = DiaryEntry.new("title", "I am the content")
      expect(diary_entry.count_words).to eq 4
    end

    it "returns zero when contents is empty" do
      diary_entry = DiaryEntry.new("title", "")
      expect(diary_entry.count_words).to eq 0
    end
  end

  context "given the wpm of a user" do
    it "returns the user's estimated reading time for the contents as an integer" do
      diary_entry = DiaryEntry.new("title", "content")
      expect(diary_entry.reading_time(1)).to eq 1
    end
  end

  context "given a wpm of 0" do
    it "fails" do
      diary_entry = DiaryEntry.new("title", "content")    
      expect { diary_entry.reading_time(0) }.to raise_error "Reading speed must be above zero."
    end
  end

  context "given the wpm of the user and the time they have to read the contents" do
    it "returns the string of content the user could read in the given time " do  
      diary_entry = DiaryEntry.new("title", "I am the content of this content")
      expect(diary_entry.reading_chunk(1, 4)).to eq "I am the content" 
    end

    it "returns the next chunk, next time we're asked" do
      diary_entry = DiaryEntry.new("title", "I am the content of this content")
      diary_entry.reading_chunk(1, 4)
      chunk = diary_entry.reading_chunk(1, 4)
      expect(chunk).to eq "of this content"
    end

    it "restarts after reading the whole content" do
      diary_entry = DiaryEntry.new("title", "I am the content")
      diary_entry.reading_chunk(1, 2)
      diary_entry.reading_chunk(1, 2)
      chunk = diary_entry.reading_chunk(1, 2)
      expect(chunk).to eq "I am"
    end
  end
end