require "rspec"
require "definitions"
require "pry"
describe("Words") do
  describe(".the_words") do
    it("allows the user to input a word and have it put into a list") do
      word = Word.new({:my_word => "car"})
      word2 = Word.new({:my_word => "forever"})
      word.save_word
      word2.save_word
      expect(Word.the_words[0].my_word).to(eq("car"))
      expect(Word.the_words[1].my_word).to(eq("forever"))
      Word.clear()
    end
  end
  describe("#save_word") do
    it("allows a user to save word into class variable @@the_words") do
      word = Word.new({:my_word => "car"})
      word.save_word
      expect(Word.the_words[0].my_word).to(eq("car"))
      Word.clear()
    end
  end
  describe(".find(id)") do
    it("finds a words based on id") do
      word = Word.new({:my_word => "car"})
      word.save_word
      word2 = Word.new({:my_word => "forever"})
      word2.save_word
      expect(Word.find(word2.id)).to(eq("forever"))
      Word.clear()
    end
  end
  describe(".find_word_def(id_to_find)") do
    it("find a definition to the word based on id") do
      word = Word.new({:my_word => "car"})
      word.save_word
      Word.update_word_def(word.id, "Metal box with 4 wheels")
      expect(Word.find_word_def(word.id)).to(eq("Metal box with 4 wheels. "))
      Word.clear()
    end
  end
  describe(".clear") do
    it("clears the array of objects") do
      word = Word.new({:my_word => "car"})
      word.save_word
      word2 = Word.new({:my_word => "forever"})
      word2.save_word
      expect(Word.clear()).to(eq([]))
      Word.clear()
    end
  end
  describe(".update_word_def") do
    it("adds a definition to the word") do
      word = Word.new({:my_word => "car"})
      word.save_word
      expect(Word.update_word_def(word.id, "Metal box with 4 wheels")).to(eq("Metal box with 4 wheels. "))
      Word.clear()
    end
  end
end
