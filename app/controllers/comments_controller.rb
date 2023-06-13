class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Comment created successfully."
      redirect_to lesson_post_path(@post.lesson.id, @post)
    else
      flash[:alert] = "Comments can't be empty."
    end
  end

  def destroy
    @comment.destroy
    redirect_to lesson_post_path(@comment.post.lesson, @comment.post), notice: "Comment successfully deleted."
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
