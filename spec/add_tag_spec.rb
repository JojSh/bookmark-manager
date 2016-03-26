feature 'Add tags' do
  scenario 'add one tag' do
    add_sky
    expect(page).to have_content('sports')
  end

  scenario 'add multiple tags' do
    add_many_tags
    expect(page).to have_content('animals, birds, pigeons')
  end

end
