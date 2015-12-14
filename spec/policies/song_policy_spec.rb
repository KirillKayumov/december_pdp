require "rails_helper"

describe SongPolicy do
  subject { described_class }

  permissions :manage? do
    let(:user) { build :user }
    let(:song) { build :song, user: user }
    let(:another_song) { build :song }

    it { is_expected.to permit(user, song) }
    it { is_expected.not_to permit(user, another_song) }
  end
end
