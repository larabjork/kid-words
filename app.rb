require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/definition')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  if params[:searchID]
    @words = [Word.find_word(params[:searchID].to_i())]
  elsif params[:searchName]
    @words = Word.search_word(params[:searchName])
  else
    @words = Word.all
  end
  erb(:words)
end




get('/words/new') do
  erb(:new_word)
end

get('/words/:id/edit') do
  @word = Word.find_word(params[:id].to_i)
  erb(:edit_word)
end

post('/words') do
  term = params[:word_term]
  word = Word.new(term, nil)
  word.save()
  @words = Word.all()
  erb(:words)
end



get('/words/:id') do
  @word = Word.find_word(params[:id].to_i())
  erb(:word)
end


patch('/words/:id') do
  @word = Word.find_word(params[:id].to_i())
  if params[:word_term] != ""
    @word.update_word(params[:word_term])
  end
  @words = Word.all
  erb(:words)
end







delete('/words/:id') do
  @word = Word.find_word(params[:id].to_i())
  @word.delete_word()
  @words = Word.all
  erb(:words)
end



get('/words/:id/definitions/:definition_id') do
  @definition = Definition.find_def(params[:definition_id].to_i())
  erb(:definition)
end


post('/words/:id/definitions') do
  @word = Word.find_word(params[:id].to_i)
  definition = Definition.new(params[:definition_term], @word.id, nil)
  definition.save
  erb(:word)
end


patch('/words/:id/definitions/:definition_id') do
  @word = Word.find_word(params[:id].to_i)
  definition = Definition.find_def(params[:definition_id].to_i)
  definition.update_def(params[:definition], @word.id)
  erb(:word)
end


delete('/words/:id/definitions/:definition_id') do
  definition = Definition.find_def(params[:definition_id].to_i)
  definition.delete_def
  @word = Word.find_word(params[:id].to_i)
  erb(:word)
end

run Sinatra::Application.run!
