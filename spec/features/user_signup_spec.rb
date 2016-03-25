feature "User sign up"  do

  scenario "when a user signs up, user count increases by 1" do

    expect{ sign_up }.to change{User.count}.by(1)
    expect(page).to have_content("Welcome yas@pigeons.com")
    expect(User.first.email).to eq("yas@pigeons.com")
  end

end
