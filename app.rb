require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/definitions')
require('pry')
require('capybara')

get('/') do
  @list_of_words = Word.the_words
  erb(:index)
end

post('/') do
  new_word = params.fetch("your_word")
  add_word = Word.new({:my_word => new_word})
  add_word.save_word()
  @id =
  @list_of_words = Word.the_words()
  erb(:index)
end

get('/output/:id') do
  @id = params[:id] 
  @list_of_words = Word.the_words()
  erb(:output)
end
