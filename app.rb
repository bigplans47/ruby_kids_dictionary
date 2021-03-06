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
  @page_word = Word.find(@id_number)
  @page_def = Word.find_word_def(@id_number)
  erb(:output)
end
post('/output/:id') do
  @list_of_words = Word.the_words()
  @id_number = params[:id]
  new_def = params.fetch("your_def")
  @page_word = Word.find(@id_number)
  @page_def = Word.find_word_def(@id_number)
  Word.update_word_def(@id_number, new_def)
  erb(:output)
end
