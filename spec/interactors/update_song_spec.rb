require "rails_helper"

describe UpdateSong do
  let(:song) { create :song, title: "Old title" }

  def perform
    described_class.call(song: song)
  end

  it "updates song" do
    song.title = "New title"

    perform

    expect(song.reload.title).to eq("New title")
  end

  it "notifies" do
    expect { perform }.to change { HipchatNotificationWorker.jobs.size }.by(1)
  end

  context "when song is invalid" do
    let(:song) { Song.new }

    it "does NOT notify" do
      expect { perform }.not_to change { HipchatNotificationWorker.jobs.size }
    end
  end
end
