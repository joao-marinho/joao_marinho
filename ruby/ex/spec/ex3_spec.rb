require File.join(File.dirname(__FILE__), "../ex3.rb")

describe "sortLetters" do
  it "sorts the characters of the word" do
    sortLetters("word").should eq("dorw")
  end
end

describe "combine_anagrams" do
  it "combine the anagrams" do
    anagrams = combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'])
    anagrams.should eq([["cars", "racs", "scar"], ["for"], ["potatoes"], ["four"], ["creams", "scream"]])
  end
end
