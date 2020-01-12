require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('create a word path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    visit('/words')
    click_on('Yes, I want to start writing!')
    fill_in('word_term', :with => 'Panda')
    click_on('Go!')
    expect(page).to have_content('Panda')
  end
end

describe('create a definition path', {:type => :feature}) do
  it('creates a word and then goes to the word page') do
    word = Word.new('Panda', nil).save
    visit("/words/#{word.id}")
    fill_in('definition_term', :with => 'Really cute black and white animal')
    click_on('Add my description')
    expect(page).to have_content('Really cute black and white animal')
  end
end
