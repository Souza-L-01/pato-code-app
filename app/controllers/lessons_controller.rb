class LessonsController < ApplicationController
  #TODO: remove when login is working
  skip_before_action :authenticate_user!, only: [:show, :search]

  before_action :set_lesson, only: [:show]

  def show
  end

  def search
    query = params[:query]
    @lessons = Lesson.where("title LIKE ? OR content LIKE ?", "%#{query}%", "%#{query}%")
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :content, :columns_explanation, :difficulty)
  end
end
