class Definition
  attr_reader :id
  attr_accessor :definition, :word_id

  @@definitions = {}
  @@total_rows = 0

  def initialize(definition, word_id, id)
    @definition = definition
    @word_id = word_id
    @id = id || @@total_rows += 1
  end

  def self.clear
    @@definitions = {}
  end

  def save
    @@definitions[self.id] = Definition.new(self.definition, self.word_id, self.id)
  end

  def self.all
    @@definitions.values
  end

end
