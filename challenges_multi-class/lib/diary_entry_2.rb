class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @content_length = contents.split(" ").length
    @furthest_read = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return @content_length
  end

  def reading_time(wpm) 
    fail "WPM must be a positive number." unless wpm.positive?
    return (@content_length.to_f / wpm).ceil
  end

  def reading_chunk(wpm, minutes) 
    fail "WPM must be a positive number." unless wpm.positive?
    fail "No time to read." unless minutes.positive?
    num_of_words = wpm * minutes
    start_at = @furthest_read  
    end_at = @furthest_read + num_of_words
    words_we_can_read = @contents.split(" ")[start_at...end_at]

    if end_at >= @content_length
      @furthest_read = 0   #if end_at is more than @content_length, the content read will be restarted > start_at = 0
    else
      @furthest_read = end_at   #saved as the end value & as start_at = furthest_read > the start_at variable will be where the last method call ended
    end
    return words_we_can_read.join(" ")
  end
end