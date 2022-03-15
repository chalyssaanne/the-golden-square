class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @word_length = @contents.split(" ").length  #can't be inside count_words as needs to be initialized first before it can be used by reading_time if count_words is not being used.
    @furthest_word_read = 0
  end

  def title
    return @title
  end

  def contents 
    return @contents
  end

  def count_words 
    return @word_length
  end

  def reading_time(wpm) 
    fail "Reading speed must be above zero." unless wpm > 0
    @estimated_reading_time = (@word_length.to_f / wpm).ceil
    return @estimated_reading_time
  end

  def reading_chunk(wpm, minutes) 
    words_we_can_read = wpm * minutes
    start_from = @furthest_word_read
    end_at = @furthest_word_read + words_we_can_read
    word_list = @contents.split(" ")[start_from...end_at]
    if end_at >= @word_length
      @furthest_word_read = 0
    else
      @furthest_word_read = end_at
    end
    return word_list.join(" ") 
  end
end