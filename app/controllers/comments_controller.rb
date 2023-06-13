class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Comment created successfully."
      redirect_to lesson_post_path(@post.lesson.id, @post)
    else
      raise
      flash[:alert] = "Comments can't be empty."
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
