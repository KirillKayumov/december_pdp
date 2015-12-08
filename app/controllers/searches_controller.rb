class SearchesController < ApplicationController
  def show
    songs = SearchSongs.call(params: params[:search]).songs.includes(:user)

    render partial: "songs/songs_list", locals: { songs: songs }
  end
end
