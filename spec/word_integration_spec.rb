require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Add a new word')
    fill_in('word_term', :with => 'Panda')
    click_on('Go!')
    expect(page).to have_content('Panda')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    word = Word.new('Panda', nil).save
    visit("/words/#{word.id}/definitions")
    fill_in('definition_term', :with => 'Really cute black and white animal')
    click_on('Add definition')
    expect(page).to have_content('Really cute black and white animal')
  end
end
