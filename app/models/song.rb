class Song < ActiveRecord::Base
  belongs_to :user

  validates :title, :text, :artist, presence: true

  scope :ordered, -> { order(:created_at) }
end
