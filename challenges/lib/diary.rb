class Diary

  def make_snippet(text)
    my_text = text.split(" ")
    if my_text.length >= 5
      return my_text[0..4].join(" ") + "..."
    else
      return text
    end 
  end

  def count_words(word)
   return word.split(" ").length
  end

end