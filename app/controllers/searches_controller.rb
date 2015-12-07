class SearchesController < ApplicationController
  def show
    results = Song.all
    results = results.with_title(params[:title]) if params[:title].present?
    results = results.with_artist(params[:artist]) if params[:artist].present?
    results = results.with_text(params[:text]) if params[:text].present?
    results = results.with_user

    render partial: "songs/songs_list", locals: { songs: results }
  end
end
