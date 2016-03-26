feature "User sign up"  do

  scenario "when a user signs up, user count increases by 1" do
    expect{ sign_up }.to change{User.count}.by(1)
    expect(page).to have_content("Welcome, roxy@cat.com")
    expect(User.last.email).to eq("roxy@cat.com")
  end

  scenario "passwords are saved as a hash" do
    sign_up
    expect(User.last.password).not_to eq("12345678")
  end

  scenario "requires a matching confirmation password" do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq("/register")
    expect(page).to have_content("Password and confirmation do not match!")
  end

  scenario "can't sign up without an email address" do
    expect{ sign_up(email:nil) }.not_to change(User, :count)
  end

  scenario "can't sign up with an invalid email address" do
    expect{ sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario "can't sign up with a previously registered email address" do
    sign_up
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content("Email address is already taken!")
  end

end
