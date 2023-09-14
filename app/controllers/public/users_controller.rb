class Public::UsersController < ApplicationController
  
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
    # @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end
  
  def mypage
    @user = current_user
    @posts = Post.all
  end
end
