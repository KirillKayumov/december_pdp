require "rails_helper"

feature "Song update" do
  let(:user) { create :user }
  let(:song) { create :song, user: user }

  background do
    login_as user
    visit song_path(song)
  end

  scenario "User updates song" do
    click_link "Edit"

    fill_in "Title", with: "Breaking News"
    click_button "Save"

    expect(page).to have_content("Song was successfully updated.")
    expect(page).to have_content("Breaking News")
  end
end
