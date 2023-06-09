class PromptsController < ApplicationController
  # def new
  # end

  def generate_text
    @prompt = Prompt.new(prompt_params)
  
    if @prompt.save
      render json: @prompt, status: :created
    else
      render json: @prompt.errors, status: :unprocessable_entity
    end
  end
  

  private

  def prompt_params
    params.require(:prompt).permit(:question)
  end
end
