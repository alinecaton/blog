class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(permited_params)
    if @user.save
      flash[:notice] = 'User created successfully'
      redirect_to posts_path
    else
      flash.now[:alert] = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  private

  def permited_params
    params.require(:user).permit(:name, :email)
  end
end