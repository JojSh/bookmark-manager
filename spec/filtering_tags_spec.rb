feature 'filtering_tags_spec' do

  scenario 'filtering tags' do
    add_sky
    add_pigeons
    visit '/tags/pigeons'
    expect(page).to have_content('pigeons')
    expect(page).not_to have_content('sports')
  end

end
