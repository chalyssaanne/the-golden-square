class GrammarStats
  def initialize
    @text_checked = 0
    @text_passed = 0
  end

  def check(text) 
    @text = text
    fail "Not a sentence." if @text.empty?
    first_letter_is_uppercase = @text[0] == @text[0].upcase
    last_character_is_valid = [".", "!", "?"].include? @text[-1]
    if first_letter_is_uppercase && last_character_is_valid
      @text_checked += 1
      @text_passed += 1
      return true
    else
      @text_checked += 1
      return false
    end   
  end

  def percentage_good
    percentage = ((@text_passed / @text_checked.to_f) * 100).ceil
    return percentage
  end
end