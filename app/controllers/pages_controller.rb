class PagesController < ApplicationController
  before_action :redirect_if_signed_in

  def home
  end

  private

  def redirect_if_signed_in
    redirect_to songs_path if user_signed_in?
  end
end
