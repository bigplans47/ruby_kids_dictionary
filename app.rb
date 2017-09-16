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
  @list_of_words = Word.the_words()
  erb(:index)
end

get('/output/:id') do
  @list_of_words = Word.the_words()
  @id_number = params[:id]

  @word_object = Word.find(@id_number)
  binding.pry




  erb(:output)
end
