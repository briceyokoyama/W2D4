require 'byebug'

#factorial
def first_anagram?(word1, word2)
  letters = word1.split("")

  anagrams_arr = letters.permutation.to_a

  anagrams_arr = anagrams_arr.map do |ele|
    ele.join("")
  end

  anagrams_arr.each do |anagram|
    return true if anagram == word2
  end
  false

end


def second_anagram?(word1, word2)
  word1.each_char do |char|
    index = word2.index(char)
    word2.slice!(index)
  end

  if word2.empty?
    true
  else
    false
  end

end

def third_anagram?(word1, word2)

  word1_arr = word1.split("")
  word2_arr = word2.split("")

  word1_arr.sort == word2_arr.sort

end

def fourth_anagram?(word1, word2)
  hash = Hash.new(0)
  
  word1.chars.each {|el| hash[el] += 1}
  word2.chars.each {|el| hash[el] -= 1}

  hash.values.all?(&:zero?)
end