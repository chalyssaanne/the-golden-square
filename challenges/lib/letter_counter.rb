class LetterCounter
  def initialize(text)
    @text = text
  end

  def calculate_most_common()
    counter = Hash.new(0) #default value was 1, needs to be 0
    most_common = nil
    most_common_count = 1
    @text.chars.each do |char|
      next unless is_letter?(char)  #skips the char if char not a letter
      counter[char] = (counter[char] || 1) + 1   #could also be counter[char] +=1
      if counter[char] > most_common_count  #the code that sets the most common letter & value
        most_common = char
        most_common_count = counter[char]  #no need to add prev common count, only need to update count value
      end
    end
    return [most_common_count, most_common]
  end

  private

  def is_letter?(letter)
    return letter =~ /[a-z]/i   #i = ruby regex case insensitive
  end
end

counter = LetterCounter.new("Digital Punk")
p counter.calculate_most_common

# Intended output:
# [2, "i"]
