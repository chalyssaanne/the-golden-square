def check_grammar(sentence)
  fail "Not a sentence." if sentence.empty?
  first_letter_is_uppercase = sentence[0] == sentence[0].upcase
  last_character_is_valid = [".", "!", "?"].include? sentence[-1]
  if first_letter_is_uppercase && last_character_is_valid
    return true
  else
    return false
  end
end