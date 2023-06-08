class LanguagesController < ApplicationController
  def index
    @language = Language.includes(:image_attachment)
    @languages = Language.all
  end

  def show
    @language = Language.find(params[:id])
  end
end
