class TracksController < ApplicationController
  # Do we want this still?
  skip_before_action :authenticate_user!, only: [:show]

  before_action :set_language, :set_track, only: [:show]

  def show
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
