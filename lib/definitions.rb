class Word

  @@the_words = []

  attr_reader(:my_word, :id)
  attr_accessor(:word_def)

  def initialize(attributes)
    @my_word = attributes.fetch(:my_word)
    @id = @@the_words.length + 1
    @word_def = ""
  end

  def self.the_words
    @@the_words
  end

  def save_word()
    @@the_words.push(self)
  end

  def self.find(only_id)
    only_id = only_id.to_i
    @@the_words.each do |word|
      if word.id == only_id
        return word.my_word
      else
        # puts "yo2"
      end
    end
  end

  def self.find_word_def(id_to_find)
    id_to_find = id_to_find.to_i
    @@the_words.each do |word|
      if word.id == id_to_find
        return word.word_def
      end
    end
  end

end
