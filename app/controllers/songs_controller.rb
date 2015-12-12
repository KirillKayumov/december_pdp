class SongsController < ApplicationController
  expose_decorated(:songs) { |default| default.ordered.with_user }
  expose_decorated(:song, attributes: :song_params)
  expose(:decorated_song) { song.decorate }

  def index
  end

  def new
  end

  def create
    song.user = current_user

    if song.save
      notify("#{decorated_song.short_info} song has been added!")
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if song.save
      notify("#{decorated_song.short_info} song has been updated!")
      redirect_to song
    else
      render :edit
    end
  end

  private

  def song_params
    params.require(:song).permit(
      :title,
      :artist,
      :lyrics,
      :single,
      :rating,
      :release_date
    )
  end

  def notify(message)
    HipchatNotificationWorker.perform_async(message)
  end
end
