class TracksController < ApplicationController
  #TODO: remove when login is working
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  before_action :set_language, only: [:index, :show]



  # GET /languages/:language_id/tracks
  def index
    @tracks = @language.tracks
    render json: @tracks
  end

  # GET /languages/:language_id/tracks/:id
  def show
    render json: @track
  end

  private

  def set_language
    @language = Language.find(params[:language_id])
  end

  def set_track
    @track = @language.tracks.find(params[:id])
  end
end
