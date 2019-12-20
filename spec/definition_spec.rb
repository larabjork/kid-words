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


end
