class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy]
  def index
    @lesson = Lesson.find(params[:lesson_id])
    @posts = @lesson.posts
  end

  def show
    @comment = Comment.new
  end

  def create
    @post = Post.new
    @post.user = current_user
    if @post.save
      redirect_to lesson_post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to lesson_path(@post.lesson), notice: "Post successfully deleted."
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
