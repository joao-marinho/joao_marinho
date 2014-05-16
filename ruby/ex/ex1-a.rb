def palindrome?(string)
  (justLetters = string.downcase.scan(/([a-z]+)/).join) == justLetters.reverse
end

p palindrome?("A man, a plan, a canal -- Panama")
p palindrome?("Madam, I'm Adam!")
p palindrome?("Abracadabra") 