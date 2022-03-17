class Diary
  def initialize
    @diary = []
  end

  def add(entry) 
    @diary << entry
  end

  def all
    return @diary
  end

  def total_word_count
    @diary.map do | diary_entry |
      diary_entry.count_words
    end.sum    #can call .sum on an end
    #@diary.map(&:count_words).sum   #uses .count_words method on all values
    #@diary.sum(&:count_words) #uses .count_words method on all values without array
  end

  def total_reading_time(wpm) 
    fail "WPM must be a positive number." unless wpm.positive?
    @diary.map do | diary_entry |
      diary_entry.reading_time(wpm)
    end.sum
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    readable_entries = @diary.filter do | entry |
      entry.reading_time(wpm) <= minutes
    end
    readable_entries.max_by do | entry |   # .max_by - returns the highest number of .count_words method
      entry.count_words
    end
    # could also use:
    #
    # sorted_by_longest = readable_entries.sort_by do | entry |
    #   entry.count_words  # `readable_entries.first` - returns the first value 
    # end   
    #
    # sorted_by_longest.last   #returns the longest value which is last in the sorted array
  end

end
