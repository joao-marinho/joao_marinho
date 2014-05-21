require File.join(File.dirname(__FILE__), "../ex1-a.rb")

describe "palindrome?" do
    it "verify a simple word" do
      palindrome?("Abracadabra").should_not be_true
    end
    it "verify a simple phrase with non-alphanumeric characters" do
      palindrome?("Madam, I'm Adam!").should be_true
    end
    it "verify a complex phrase with non-alphanumeric characters" do
      palindrome?("A man, a plan, a canal -- Panama").should be_true
    end

end
