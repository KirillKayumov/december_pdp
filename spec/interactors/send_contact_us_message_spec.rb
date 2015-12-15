require "rails_helper"

describe SendContactUsMessage do
  describe ".call" do
    let(:params) do
      {
        full_name: "Kendrick Lamar",
        email: "k.lamar@rap.com",
        phone_number: "1234567890",
        text: "Hello!"
      }
    end
    let(:form) { double :form, params.merge(valid?: true) }
    let(:mailer_mock) { double(:mailer, notify: true) }

    before do
      allow(ContactUsMailer).to receive(:delay).and_return(mailer_mock)
    end

    def do_call
      described_class.call(form: form)
    end

    it "sends email" do
      expect(mailer_mock).to receive(:notify).with(*params.values)

      do_call
    end

    context "when form is invalid" do
      let(:form) { double :form, params.merge(valid?: false) }

      it "does NOT send email" do
        expect(mailer_mock).not_to receive(:notify)

        do_call
      end
    end
  end
end
