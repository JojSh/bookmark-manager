require './app/models/link'

feature "View links" do
  scenario "see a list of links on the links page" do
    add_sky
    expect(page.status_code).to eq 200

    within "ul#links" do
      expect(page).to have_content("Sky Sports")
    end
  end
end
