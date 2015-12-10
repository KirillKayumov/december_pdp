require "rails_helper"

feature "Search songs", js: true do
  let!(:song1) { create :song, title: "Song1", artist: "Artist1", rating: 0 }
  let!(:song2) { create :song, title: "Song2", artist: "Artist1", rating: 1 }
  let!(:song3) { create :song, title: "Song3", artist: "Artist2", rating: 2 }

  background do
    visit root_path
  end

  scenario "User searches songs" do
    fill_in "Artist:", with: "Artist1"
    click_button "Search"

    expect(page).to have_content("Song1")
    expect(page).to have_content("Song2")
    expect(page).to have_no_content("Song3")

    fill_in "Title:", with: "Song1"
    click_button "Search"

    expect(page).to have_content("Song1")
    expect(page).to have_no_content("Song2")
    expect(page).to have_no_content("Song3")

    fill_in "Rating:", with: "3"
    click_button "Search"

    expect(page).to have_content("No results")
  end
end
