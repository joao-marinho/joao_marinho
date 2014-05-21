def palindrome?(string)
  (justLetters = string.downcase.scan(/([a-z]+)/).join) == justLetters.reverse
end
