class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_lesson, only: [:show]

  # GET /lessons
  def index
    @lessons = Lesson.all
    render json: @lessons
  end

  # GET /lessons/:id
  def show
    render json: @lesson
  end

  # POST /lessons
  def create
    @lesson = Lesson.new(lesson_params)

    if @lesson.save
      render json: @lesson, status: :created
    else
      render json: @lesson.errors, status: :unprocessable_entity
    end
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :content, :columns_explanation, :difficulty)
  end
end
