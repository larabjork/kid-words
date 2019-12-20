class Word
  attr_reader :id
  attr_accessor :term

  @@words = {}
  @@total_rows = 0

  def initialize(term, id)
    @term = term
    @id = id || @@total_rows += 1
  end

  def save
    @@words[self.id] = Word.new(self.term, self.id)
  end

  def self.all
    @@words.values
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def update_word(term)
    @term = term
  end

  def delete_word
    @@words.delete(self.id)
  end

  def self.find_word(id)
    @@words[id]
  end

  def self.search_word(term)
    @@words.values.select { |word| word.term == term }
  end

  def definitions
    Definition.find_by_word(self.id)
  end

end
