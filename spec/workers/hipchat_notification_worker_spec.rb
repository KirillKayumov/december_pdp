require "rails_helper"

describe HipchatNotificationWorker do
  describe "#perform" do
    let(:token) { "token" }
    let(:room) { "room" }
    let(:client_stub) { double(:client) }
    let(:room_stub) { double(:room) }
    let(:message) { "My message" }

    before do
      stub_const("#{described_class}::TOKEN", token)
      stub_const("#{described_class}::ROOM", room)
      allow(HipChat::Client).to receive(:new).and_return(client_stub)
      allow(client_stub).to receive(:[]).with(room).and_return(room_stub)
    end

    it "sends notification" do
      expect(room_stub).to receive(:send).with("December PDP", message, notify: true)

      described_class.new.perform(message)
    end
  end
end
