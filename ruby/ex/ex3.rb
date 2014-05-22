def combine_anagrams(words)
  words.each_with_object Hash.new do |word, h| h[wordSorted = sortLetters(word)] = Array(h[wordSorted]) << word end.values
end

def sortLetters(word)
  word.split(//).sort.join
end
