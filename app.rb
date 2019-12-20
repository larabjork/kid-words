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

get('/words/new') do
  erb(:new_word)
end

post('/words') do
  term = params[:word_term]
  word = Word.new(term, nil)
  word.save()
  @words = Word.all()
  erb(:words)
end

get('/words/:id/edit') do
  @word = Word.find(params[:id].to_i)
  erb(:edit_word)
end
