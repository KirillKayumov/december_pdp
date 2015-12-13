class SongDecorator < ApplicationDecorator
  delegate :artist,
    :title,
    :lyrics,
    :single,
    :image,
    :image_attacher,
    :user_full_name

  def short_info
    "#{artist} – #{title}"
  end

  def added_by
    object.user.full_name
  end

  def rating
    object.rating.presence || "n/a"
  end

  def release_date
    I18n.l(object.release_date, format: :ru_date)
  end
end
