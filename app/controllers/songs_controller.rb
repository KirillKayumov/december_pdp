class SongsController < ApplicationController
  expose(:songs) { |default| default.ordered.with_user }
  expose(:song, attributes: :song_params)

  def index
  end

  def new
  end

  def create
    song.user = current_user

    if song.save
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
      :text,
      :single,
      :rating,
      :release_date
    )
  end
end
