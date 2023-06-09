class TracksController < ApplicationController
  def show
    @track = Track.find(params[:language_id])
    @lessons = @track.lessons
  end
end
