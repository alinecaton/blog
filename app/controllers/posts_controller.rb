class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(permited_params)
    if @post.save
      redirect_to @post
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @post = Post.find params[:id]
  end

  private

  def permited_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
