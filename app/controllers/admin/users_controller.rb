class Admin::UsersController < ApplicationController
  def index
    @users = User.all
    # @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      #成功
      redirect_back(fallback_location: root_path)
    else
      #失敗
      redirect_back(fallback_location: root_path)
    end
  end
end

private

def user_params
  params.require(:user).permit(:freeze,:is_deleted)
end