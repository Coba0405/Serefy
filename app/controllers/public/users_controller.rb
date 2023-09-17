class Public::UsersController < ApplicationController
  # before_action :get_profile_image, only: [:show]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def edit
    @user = current_user
    # @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(user_params)
      # @user.profile_image.attach(params[:user][:profile_image])
      redirect_to public_user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end
  
  def mypage
    @user = current_user
    @posts = current_user.posts
  end
  
  private
  def user_params
    params.require(:user).permit(:account_name, :introduction, :gender, :age_groups, :profile_image)
  end
  
  def get_profile_image
  　@user = current_user
    unless @user.profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      @user.profile_image.attach(io: File.open(file_path), content_type: 'image/png')
    end    
  end
end
