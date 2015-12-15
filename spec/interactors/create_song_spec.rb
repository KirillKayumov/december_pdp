require "rails_helper"

describe CreateSong do
  let(:user) { build :user }
  let(:song) { build :song }

  def perform
    described_class.call(song: song, current_user: user)
  end

  it "creates song" do
    expect { perform }.to change { Song.count }.by(1)
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
