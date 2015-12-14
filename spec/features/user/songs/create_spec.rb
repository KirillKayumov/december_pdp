require "rails_helper"

feature "Song creation" do
  let(:user) { create :user }

  let(:songs) { find(".songs") }

  background do
    login_as user
    visit root_path
  end

  scenario "User creates song" do
    click_link "Add new song"

    fill_in "Title", with: "All Night Long"
    fill_in "Artist", with: "MGK"
    fill_in "Lyrics", with: "Some lyrics"
    click_button "Save"

    expect(page).to have_content("Song was successfully created.")
    expect(songs).to have_content("All Night Long")
    expect(songs).to have_content("MGK")
  end
end
