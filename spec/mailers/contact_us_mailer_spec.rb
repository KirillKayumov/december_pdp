require "rails_helper"

describe ContactUsMailer do
  describe "#notify" do
    let(:admin_email) { "admin@gmail.com" }
    let(:contact_us_from_email) { "contact.us@from.com" }
    let(:full_name) { "Kendrick Lamar" }
    let(:email) { "k.lamar@rap.com" }
    let(:phone_number) { "1234567890" }
    let(:text) { "Hello!" }

    before do
      stub_const("#{described_class}::ADMIN_EMAIL", admin_email)
      stub_const("#{described_class}::CONTACT_US_FROM_EMAIL", contact_us_from_email)
    end

    subject { described_class.notify(full_name, email, phone_number, text) }

    it { is_expected.to deliver_to(admin_email) }
    it { is_expected.to be_delivered_from(contact_us_from_email) }
    it { is_expected.to have_subject("New message from Contact Us") }
    it { is_expected.to have_body_text(full_name) }
    it { is_expected.to have_body_text(email) }
    it { is_expected.to have_body_text(phone_number) }
    it { is_expected.to have_body_text(text) }
  end
end
