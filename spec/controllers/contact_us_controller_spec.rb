require "rails_helper"

describe ContactUsController do
  describe "#create" do
    let(:params) do
      {
        contact_us_form: {
          full_name: "Kendrick Lamar",
          email: "k.lamar@rap.com",
          phone_number: "1234567890",
          text: "Hello!"
        }
      }
    end
    let(:delayed_mailer) { double(:mailer, notify: true) }

    def do_create
      post :create, params
    end

    before do
      allow(ContactUsMailer).to receive(:delay).and_return(delayed_mailer)
    end

    it "notifies about new message" do
      expect(delayed_mailer).to receive(:notify).with(
        "Kendrick Lamar",
        "k.lamar@rap.com",
        "1234567890",
        "Hello!"
      )

      do_create
    end

    context "when params are invalid" do
      let(:params) do
        {
          contact_us_form: {
            full_name: "Kendrick Lamar"
          }
        }
      end

      it "does NOT notify about new message" do
        expect(delayed_mailer).not_to receive(:notify)

        do_create
      end
    end
  end
end
