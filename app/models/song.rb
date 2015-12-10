class Song < ActiveRecord::Base
  include PgSearch

  belongs_to :user

  validates :title, :lyrics, :artist, presence: true

  scope :ordered, -> { order(:created_at) }
  scope :single, -> { where(single: true) }
  scope :with_release_date, -> (date) { where(release_date: date) }
  scope :with_rating, -> (rating) { where(rating: rating) }
  scope :with_user, -> { includes(:user) }

  attachment :image

  %w(title lyrics artist).each do |column|
    pg_search_scope "with_#{column}", against: column, using: { tsearch: { prefix: true } }
  end

  delegate :full_name, to: :user, prefix: true
end
