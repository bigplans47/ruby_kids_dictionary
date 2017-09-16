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
  # based on word find definition
  @page_def = Word.find_word_def(@id_number)
  erb(:output)
end

post('/output/:id') do
  @id_number = params[:id]
  # binding.pry
  new_def = params.fetch("your_def")
  # need a way to write over the old definition of the word and link to right page
  # now get access to the word to update its def
  @page_word = Word.find(@id_number)
  # @page_word.word_def << new_def
  @page_def = Word.find_word_def(@id_number)
  @page_def << ", "+new_def
  erb(:output)

end
