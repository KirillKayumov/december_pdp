require "rails_helper"

describe DestroySong do
  let!(:song) { create :song }

  def perform
    described_class.call(song: song)
  end

  it "destroys song" do
    expect { perform }.to change { Song.count }.by(-1)
  end

  it "notifies" do
    expect { perform }.to change { HipchatNotificationWorker.jobs.size }.by(1)
  end
end
