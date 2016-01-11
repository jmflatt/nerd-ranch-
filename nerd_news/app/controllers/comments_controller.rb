class CommentsController < ApplicationController
  respond_to :html

  def new
    @comment = current_user.comments.new
  end

  def create
    @comment = current_user.comments.new(comment_params)

    authorize @comment
    flash[:success] = 'Comment Created' if @comment.save
    respond_with @comment, location: @comment.commentable
  end

  def show
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def close_thread
      @comment = Comment.find(params[:comment_id])

      authorize @comment
      @comment.transaction do
        @comment.close_thread
      end
      redirect_to @comment
  end

  private

  def comment_params
    params[:comment].permit(:commentable_type, :commentable_id, :body)
  end
end
