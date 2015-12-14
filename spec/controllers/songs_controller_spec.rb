require "rails_helper"

describe SongsController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "#create" do
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

    it "creates song" do
      expect { do_create }.to change { Song.count }.by(1)
    end

    it "creates job for hipchat notifications worker" do
      expect { do_create }.to change { HipchatNotificationWorker.jobs.size }.by(1)
    end

    context "when params are invalid" do
      let(:params) { { song: { title: "Title" } } }

      it "does NOT create job for hipchat notifications worker" do
        expect { do_create }.to change { HipchatNotificationWorker.jobs.size }.by(0)
      end
    end
  end

  describe "#update" do
    let(:song) { create :song, user: user }
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

    it "updates song" do
      expect { do_update }.to change { song.reload.title }.to("New title")
    end

    it "creates job for hipchat notifications worker" do
      expect { do_update }.to change { HipchatNotificationWorker.jobs.size }.by(1)
    end

    context "when params are invalid" do
      let(:params) do
        {
          id: song.id,
          song: { title: "" }
        }
      end

      it "does NOT create job for hipchat notifications worker" do
        expect { do_update }.to change { HipchatNotificationWorker.jobs.size }.by(0)
      end
    end
  end

  describe "#destroy" do
    let!(:song) { create :song, user: user }

    def do_destroy
      delete :destroy, id: song.id
    end

    it "destroys song" do
      expect { do_destroy }.to change { Song.count }.by(-1)
    end

    it "creates job for hipchat notifications worker" do
      expect { do_destroy }.to change { HipchatNotificationWorker.jobs.size }.by(1)
    end
  end
end
