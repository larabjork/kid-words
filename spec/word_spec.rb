require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe '#Word' do

  before(:each)do
  Word.clear
  end

  describe ('.all') do
    it("is empty")do
    expect(Word.all()).to(eq([]))
    end
  end

  describe ('#save') do
    it ('save the word that the user enters') do
      word1 = Word.new("stupendous", nil).save
      word2 = Word.new("grotesque", nil).save
      expect(Word.all).to(eq([word1, word2]))
    end
  end

  describe('.clear') do
      it("clears all words") do
        word1 = Word.new("stupendous", nil).save
        word2 = Word.new("grotesque", nil).save
        Word.clear
        expect(Word.all).to(eq([]))
      end
    end

  describe('#update_word') do
    it("updates a word entry--not the definition") do
      word1 = Word.new('gaint', nil).save
      word1.update_word('giant')
      expect(word1.term).to(eq("giant"))
    end
  end

  describe('#delete_word') do
    it("deletes a word entry") do
      word1 = Word.new("stupendous", nil).save
      word2 = Word.new("grotesque", nil).save
      word1.delete_word()
      expect(Word.all).to(eq([word2]))
    end
  end

  describe('.find_word') do
    it("finds a word by id") do
      word1 = Word.new("stupendous", nil).save
      expect(Word.find_word(word1.id)).to(eq(word1))
    end
  end

  describe('.search_word') do
    it("finds a word entry when word is entered") do
      word1 = Word.new("stupendous", nil).save
      expect(Word.search_word(word1.term)).to(eq([word1]))
    end
  end




end
