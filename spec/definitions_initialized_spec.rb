require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
describe('the definition path', {:type => :feature}) do
  it('processes the user entry to a list and allows said entry to be click and a definition to be added to it') do
    visit('/')
    fill_in('your_word', :with => 'Ruby')
    click_button('Add')
    expect(page).to have_content('Ruby')
    visit('/output/1')
    fill_in('your_def', :with => 'A beautiful red gem')
    click_button('Add')
    expect(page).to have_content('A beautiful red gem.')
    Word.clear()
  end
end
