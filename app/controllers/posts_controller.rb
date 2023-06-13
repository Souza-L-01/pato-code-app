class PostsController < ApplicationController
  def index
    @lesson = Lesson.find(params[:lesson_id])
    @posts = @lesson.posts
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
end
