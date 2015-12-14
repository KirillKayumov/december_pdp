require "rails_helper"

describe SongsController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "#create" do
    let(:user) { create :user }
    let(:params) do
      {
        song: {
          title: "Title",
          artist: "Artist",
          lyrics: "Lyrics"
        }
      }
    end

    def do_create
      post :create, params
    end

    it "creates job for hipchat notifications worker" do
      expect { do_create }.to change { HipchatNotificationWorker.jobs.size }.by(1)
    end
  end

  describe "#update" do
    let(:song) { create :song }
    let(:params) do
      {
        id: song.id,
        song: {
          title: "New title"
        }
      }
    end

    def do_update
      put :update, params
    end

    it "creates job for hipchat notifications worker" do
      expect { do_update }.to change { HipchatNotificationWorker.jobs.size }.by(1)
    end
  end
end
