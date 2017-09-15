require "rspec"
require "definitions"
require "pry"

describe("#the_words") do
  it("allows the user to input a word and have it put into a list") do
    # input1 = {:key => "value"}
    word = Word.new({:my_word => "value"})
    word.save_word
    expect(Word.the_words[0] == "value")
  end
end
