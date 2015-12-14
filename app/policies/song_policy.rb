class SongPolicy < ApplicationPolicy
  def manage?
    record.user == user
  end
end
