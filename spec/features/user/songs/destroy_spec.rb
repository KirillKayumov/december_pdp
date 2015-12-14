require "rails_helper"

feature "Song destroying" do
  let(:user) { create :user }
  let(:song) { create :song, user: user, title: "Breaking News" }

  background do
    login_as user
    visit song_path(song)
  end

  scenario "User destroys song" do
    click_link "Delete"

    expect(page).to have_content("Song was successfully destroyed.")
    expect(page).to have_no_content("Breaking News")
  end
end
