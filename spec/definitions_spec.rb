require "rspec"
require "definitions"
require "pry"

describe("Words#the_words") do
  it("allows the user to input a word and have it put into a list") do
    # input1 = {:key => "value"}
    word = Word.new({:my_word => "car"})
    word2 = Word.new({:my_word => "forever"})
    word.save_word
    word2.save_word
    expect(Word.the_words[0].my_word).to(eq("car"))
    expect(Word.the_words[1].my_word).to(eq("forever"))
    Word.clear()
  end

  it("allows user to add a definition to a the word forever") do
  word2 = Word.new({:my_word => "forever"})
  word2.save_word
  Word.update_word_def(1, "For an unlimted amount of time")
  expect(word2.word_def).to(eq("For an unlimted amount of time. "))
  end


end
