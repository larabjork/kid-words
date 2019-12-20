class Word
  attr_reader :id
  attr_accessor :word

  @@words = {}
  @@total_rows = 0

  def initialize(word, id)
    @word = word
    @id = id || @@total_rows += 1
  end

  def save
    @@words[self.id] = Word.new(self.word, self.id)
  end

  def self.all
    @@words.values
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def update_word(word)
    @word = word
  end

  def delete_word
    @@words.delete(self.id)
  end
end
