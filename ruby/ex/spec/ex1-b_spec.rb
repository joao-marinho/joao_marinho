require File.join(File.dirname(__FILE__), "../ex1-b.rb")

describe "count_words" do
  it "count words in a simple sentence without alphanumeric characters" do
    hash = count_words "Doo bee doo bee doo"
    hash["doo"].should be(3);
    hash["bee"].should be(2);
    hash["lol"].should be(nil);
  end

  it "count words in a sentence with alphanumeric characters" do
    hash = count_words("A man, a plan, a canal -- Panama")
    hash["a"].should be(3)
    hash["man"].should be(1)
    hash["plan"].should be(1)
    hash["canal"].should be(1)
    hash["panama"].should be(1)
    hash[","].should be(nil)
  end

end
