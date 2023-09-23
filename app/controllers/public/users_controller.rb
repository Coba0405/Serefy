class Public::UsersController < ApplicationController
  # before_action :get_profile_image, only: [:show]
  # before_action :set_user, only: [:likes]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    # @user = current_user
    page = params[:page] || 1
    @posts = @user.posts.page(page)
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
    # @post = Post.find(params[:id])
  end
  
  def likes
    p "--------------"
    p @post = Post.find(params[:id])

    # likes = Like.where(user_id: @user.id).pluck(:post_id)
    # @like_posts = Post.find(likes)
    p "---------------"
  end
  
  def likes_post
    @user = User.find(params[:id])
    likes = Like.where(user_id: @user.id).pluck(:post_id)
    @like_posts = Post.find(likes)
  end
  
  private
  def user_params
    params.require(:user).permit(:account_name, :introduction, :gender, :age_groups, :profile_image, :id)
  end
  
  def get_profile_image
  　@user = current_user
    unless @user.profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      @user.profile_image.attach(io: File.open(file_path), content_type: 'image/png')
    end    
  end
  
  # def set_user
  #   @user = User.find(params[:id])
  # end
end
