feature "User sign up"  do

  scenario "when a user signs up, user count increases by 1" do
    expect{ sign_up }.to change{User.count}.by(1)
    expect(page).to have_content("Welcome joj@pigeons.com")
    expect(User.last.email).to eq("joj@pigeons.com")
  end

  scenario "passwords are saved as a hash" do
    sign_up
    expect(User.last.password).not_to eq("pigeon1")
  end
end
