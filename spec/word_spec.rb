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
        word1 = Word.new("stupendous", nil)
        word1.save
        word2 = Word.new("grotesque", nil)
        word2.save
        Word.clear
        expect(Word.all).to(eq([]))
      end
    end



end
