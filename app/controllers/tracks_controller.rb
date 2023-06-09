class TracksController < ApplicationController
  #TODO: remove when login is working
  skip_before_action :authenticate_user!, only: [:show]

  before_action :set_language, only: [:show]

  def show
     @track = Track.find(params[:language_id])
    @lessons = @track.lessons
  end

  private

  def set_language
    @language = Language.find(params[:language_id])
  end

  def set_track
    @track = @language.tracks.find(params[:id])
  end
end
