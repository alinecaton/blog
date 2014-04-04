class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(permited_params)
    if @post.save
      flash[:notice] = 'Post created successfully.'
      redirect_to @post
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(permited_params)
      flash[:notice] = 'Post edited successfully.'
      redirect_to @post
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render :edit
    end
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to posts_url
  end

  private

  def set_post
    @post = Post.find params[:id]
  end

  def permited_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
