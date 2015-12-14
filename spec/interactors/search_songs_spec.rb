require "rails_helper"

describe SearchSongs do
  describe ".call" do
    let(:default_params) do
      {
        title: "Song title",
        artist: "Song artist",
        lyrics: "Song lyrics",
        single: false,
        release_date: "06/09/1995",
        rating: 5
      }
    end

    let!(:song_title) { create :song, default_params.merge(title: "My Awesome title") }
    let!(:song_artist) { create :song, default_params.merge(artist: "My Good artist") }
    let!(:song_lyrics) { create :song, default_params.merge(lyrics: "My Awesome lyrics") }
    let!(:song_single) { create :song, default_params.merge(single: true) }
    let!(:song_release_date) { create :song, default_params.merge(release_date: "01/01/2010") }
    let!(:song_rating) { create :song, default_params.merge(rating: 10) }

    def results(params)
      described_class.call(params: params).songs
    end

    it "searches by title" do
      params = { title: "Awesome title" }
      expect(results(params)).to eq([song_title])
    end

    it "searches by artist" do
      params = { artist: "Good artist" }
      expect(results(params)).to eq([song_artist])
    end

    it "searches by lyrics" do
      params = { lyrics: "Awesome lyrics" }
      expect(results(params)).to eq([song_lyrics])
    end

    it "searches by single flag" do
      params = { single: true }
      expect(results(params)).to eq([song_single])
    end

    it "searches by release_date" do
      params = { release_date: "01/01/2010" }
      expect(results(params)).to eq([song_release_date])
    end

    it "searches by rating" do
      params = { rating: 10 }
      expect(results(params)).to eq([song_rating])
    end

    context "when there are several search attributes" do
      let!(:universal_song) { create :song, title: "My Awesome title", artist: "My Good artist", rating: 10 }

      it "searches by several attributes" do
        params = { title: "Awesome", artist: "Good", rating: 10 }
        expect(results(params)).to eq([universal_song])
      end
    end
  end
end
