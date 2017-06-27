class CommentsController < ApplicationController
  before_action :require_sign_in

  def new
    @comment = Comment.new
    @comment.post_id = params[:post_id]
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    if @comment.save
      redirect_to post_url(@comment.post_id)
    else
      flash[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end

end
