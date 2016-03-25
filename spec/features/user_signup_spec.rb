feature "User sign up"  do

  scenario "when a user signs up, user count increases by 1" do
    expect{ sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome yas@pigeons.com")
    expect("yas@pigeons.com").to eq(user.email)
  end

end


# expect { x += 1 }.to change {x}.by(1)
