require "rails_helper"

describe User do
  it { is_expected.to validate_presence_of :full_name }

  it "pauses for 30 secs" do
    sleep 30
  end
end
