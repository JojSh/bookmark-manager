feature "User sign up"  do

  scenario "when a user signs up, user count increases by 1" do
    expect{ sign_up }.to change{User.count}.by(1)
    expect(page).to have_content("Welcome, joj@pigeons.com")
    expect(User.last.email).to eq("joj@pigeons.com")
  end

  scenario "passwords are saved as a hash" do
    sign_up
    expect(User.last.password).not_to eq("pigeon1")
  end

  # scenario "password & confirm password mismatch raises error" do
  #   visit "/"
  #   click_button("Sign up")
  #   fill_in :address, with: "joj@pigeons.com"
  #   fill_in :pw, with: "pigeon1"
  #   fill_in :pwc, with: "pigron1"
  #   expect(click_button("Register")).to raise("Invalid login credentials.")
  # end

  scenario "requires a matching confirmation password" do
    expect{ bad_sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def bad_sign_up(email: "roxy@cat.com",
                  password: "12345678",
                  password_confirmation: "12345678")
    visit "/"
    click_button("Sign up")
    fill_in :address, with: email
    fill_in :pw, with: password
    fill_in :pwc, with: password_confirmation
    click_button("Register")
  end

end
