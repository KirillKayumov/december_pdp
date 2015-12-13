require "rails_helper"

describe SongDecorator do
  let(:decorated_song) { described_class.new(song) }

  describe "#short_info" do
    let(:song) { build :song, title: "Studio", artist: "Schoolboy Q" }

    subject { decorated_song.short_info }

    it { is_expected.to eq("Schoolboy Q – Studio") }
  end

  describe "#added_by" do
    let(:user) { create :user, full_name: "Kevin" }
    let(:song) { build :song, user: user }

    subject { decorated_song.added_by }

    it { is_expected.to eq("Kevin") }
  end

  describe "#rating" do
    let(:song) { create :song, rating: 8 }

    subject { decorated_song.rating }

    it { is_expected.to eq(8) }

    context "when rating is NOT present" do
      let(:song) { create :song, rating: nil }

      it { is_expected.to eq("n/a") }
    end
  end

  describe "#release_date" do
    let(:song) { create :song, release_date: Date.parse("06/09/1995") }

    subject { decorated_song.release_date }

    it { is_expected.to eq("06/09/1995") }
  end
end
