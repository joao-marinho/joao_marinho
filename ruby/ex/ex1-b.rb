def count_words(string)
  string.downcase.scan(/([a-z]+)/).each_with_object Hash.new do |(k), hash| hash[k] = hash[k] ? hash[k] + 1 : 1 end
end
