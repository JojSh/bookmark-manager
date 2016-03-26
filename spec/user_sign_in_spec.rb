feature "User sign in" do


  let(:user) do
    User.create(email: "someone@something.com",
                password: "somepassword2",
                password_confirmation: "somepassword2")
  end



  scenario "with correct email and password" do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content("Welcome #{user.email}")
  end

end
