feature 'Homepage' do

  scenario "opens on welcome page" do

    visit "/"
    expect(page).to have_button("Sign up")    
  end
end
