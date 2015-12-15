class SongsController < ApplicationController
  respond_to :html

  before_action :authenticate_user!, except: %i(index show)
  before_action :authorize_resource, only: %i(edit update destroy)

  expose_decorated(:songs) { |default| default.ordered }
  expose_decorated(:song, attributes: :song_params)
  expose(:decorated_song) { song.decorate }

  def index
  end

  def new
  end

  def create
    CreateSong.call(song: song, current_user: current_user)
    respond_with song, location: root_path
  end

  def show
  end

  def edit
  end

  def update
    UpdateSong.call(song: song)
    respond_with song
  end

  def destroy
    DestroySong.call(song: song)
    respond_with song, location: root_path
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

  def authorize_resource
    authorize song, :manage?
  end
end
