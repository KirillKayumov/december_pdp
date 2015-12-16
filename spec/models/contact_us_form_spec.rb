require "rails_helper"

describe ContactUsForm do
  describe "#full_name" do
    let(:form) { described_class.new(user: user, full_name: "Taylor") }

    subject { form.full_name }

    context "when user is present" do
      let(:user) { double(:user, full_name: "Kendrick") }

      it { is_expected.to eq("Kendrick") }
    end

    context "when user is NOT present" do
      let(:user) { nil }

      it { is_expected.to eq("Taylor") }
    end
  end

  describe "#email" do
    let(:form) { described_class.new(user: user, email: "user1@example.com") }

    subject { form.email }

    context "when user is present" do
      let(:user) { double(:user, email: "user2@example.com") }

      it { is_expected.to eq("user2@example.com") }
    end

    context "when user is NOT present" do
      let(:user) { nil }

      it { is_expected.to eq("user1@example.com") }
    end
  end
end
