require 'rspec'
require 'word'
require 'definition'
require 'pry'

describe '#Word' do

  describe ('#save') do
    it ('save the word that the user enters') do
      word1 = Word.new("stupendous", nil)
      word1.save
      word2 = Word.new("grotesque", nil)
      word2.save
      expect(Word.all).to(eq([word1, word2]))
    end
  end





end
