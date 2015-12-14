class SongsController < ApplicationController
  respond_to :html

  before_action :authenticate_user!, except: :index

  expose_decorated(:songs) { |default| default.ordered }
  expose_decorated(:song, attributes: :song_params)
  expose(:decorated_song) { song.decorate }

  def index
  end

  def new
  end

  def create
    song.user = current_user

    notify("#{decorated_song.short_info} song has been added!") if song.save
    respond_with song, location: root_path
  end

  def show
  end

  def edit
  end

  def update
    notify("#{decorated_song.short_info} song has been updated!") if song.save
    respond_with song
  end

  private

  def song_params
    params.require(:song).permit(
      :title,
      :artist,
      :lyrics,
      :single,
      :rating,
      :release_date,
      :image
    )
  end

  def notify(message)
    HipchatNotificationWorker.perform_async(message)
  end
end
