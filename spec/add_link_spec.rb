require './app/models/link'

feature 'Adding links:' do
  scenario 'creates additional links' do
    add_sky
    expect(page).to have_content("Add link")
    expect(page).to have_content("www.skysports.com")
  end
end
