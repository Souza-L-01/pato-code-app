class LanguagesController < ApplicationController
  #TODO: remove when login is working
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @language = Language.includes(:image_attachment)
    @languages = Language.all
  end

  def show
    @language = Language.find(params[:id])
    @tracks = @language.tracks
  end
end
