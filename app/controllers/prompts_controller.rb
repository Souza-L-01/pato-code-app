class PromptsController < ApplicationController
  def show
    @prompt = Prompt.find(params[:id])
  end

  def new 
    @prompt = Prompt.new
  end

  def generate_text
    @prompt = Prompt.new(prompt_params)
    @prompt.user = current_user
  
    if @prompt.save
      redirect_to prompt_path(@prompt)
    else
      render json: @prompt.errors, status: :unprocessable_entity
    end
  end
  
  private

  def prompt_params
    params.require(:prompt).permit(:question)
  end
end
