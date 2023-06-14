class RecordingsController < ApplicationController
  def new
      @recording = Recording.new
      @recordings = Recording.all
    end
  
    def create
      @recording = Recording.new(recording_params)
      @recording.user = current_user
      
      if @recording.save
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    private
  
    def recording_params
      params.require(:recording).permit(:audio)
    end
end
