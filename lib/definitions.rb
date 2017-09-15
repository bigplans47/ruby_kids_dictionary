class Word

  @@the_words = []

  attr_reader(:my_word)

  def initialize(attributes)
    @my_word = attributes.fetch(:my_word)
    @id = @@the_words.length + 1
  end

  def self.the_words
    @@the_words
  end

  def save_word()
    @@the_words.push(self)
  end


end
