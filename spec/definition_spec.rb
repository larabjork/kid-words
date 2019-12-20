require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("glamorous", nil)
    @word.save()
  end

  describe('.clear') do
    it("clears all definitions") do
      def1 = Definition.new('fancy', @word.id, nil).save
      def2 = Definition.new('really pretty', @word.id, nil).save
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      def3 = Definition.new('like my mom', @word.id, nil).save
      expect(Definition.all).to(eq([def3]))
    end
  end


  describe ('.all') do
    it('lists all the definitions for a single word') do
      def1 = Definition.new('fancy', @word.id, nil).save
      def2 = Definition.new('really pretty', @word.id, nil).save
      expect(Definition.all).to(eq([def1, def2]))
    end
  end

  describe ('#update_def') do
    it('updates a definition after the user edits it') do
      def1 = Definition.new('fancy', @word.id, nil).save
      def1.update_def('extra fancy', @word.id)
      expect(def1.definition).to(eq('extra fancy'))
    end
  end

  describe ('#delete_def') do
    it('deletes a definition of a word') do
      def1 = Definition.new('fancy', @word.id, nil).save
      def2 = Definition.new('really pretty', @word.id, nil).save
      def1.delete_def
      expect(Definition.all).to(eq([def2]))
    end
  end

  describe('.find_def') do
    it("finds a definition by id") do
      def1 = Definition.new('fancy', @word.id, nil).save
      def2 = Definition.new('really pretty', @word.id, nil).save
      expect(Definition.find_def(def1.id)).to(eq(def1))
    end
  end

  describe('.find_by_word') do
  it("finds definitions for a word") do
    word1 = Word.new("stupendous", nil).save
    def1 = Definition.new('really cool', @word.id, nil).save
    def2 = Definition.new('even better than cool', @word.id, nil).save
    expect(Definition.find_by_word(word1.id)).to(eq([def2]))
  end
end

end
