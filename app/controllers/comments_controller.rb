class CommentsController < ApplicationController
  def create
    @comment = Comment.new(permited_params)
    @post = @comment.post

    if @comment.save
      flash[:notice] = 'Comment created sucessfully'
      redirect_to post_path(@post.id)
    else
      flash.now[:alert] = @comment.errors.full_messages.to_sentence
      render 'posts/show'
    end
  end

  private

  def permited_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
