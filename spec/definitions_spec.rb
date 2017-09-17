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
  end

  it("allows user to add a definition to a car") do
  hash_0 = Word.the_words[0]
  the_id = hash_0.id
  {:word_def => "a road vehicle, typically with four wheels, powered by an internal combustion engine and able to carry a small number of people."}
  the_def = Word.find_word_def(the_id)
  expect(the_def << "a road vehicle, typically with four wheels, powered by an internal combustion engine and able to carry a small number of people." )

  end


end
