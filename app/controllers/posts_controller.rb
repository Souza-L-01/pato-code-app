class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy]
  before_action :set_lesson, only: %i[index create]

  def index
    @post = Post.new
  end

  def show
    @comment = Comment.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.lesson = @lesson
    if @post.save
      redirect_to lesson_posts_path(@lesson)
    else
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to lesson_path(@post.lesson.id), notice: "Post successfully deleted."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
