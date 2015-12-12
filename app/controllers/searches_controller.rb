class SearchesController < ApplicationController
  def show
    songs = SearchSongs
      .call(params: params[:search])
      .songs
      .includes(:user)
      .decorate

    render partial: "songs/songs_list", locals: { songs: songs }
  end
end
