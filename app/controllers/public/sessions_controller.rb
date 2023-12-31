# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]
  
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password, :name])
  end

  # GET /resource/sign_in
  # def new 
  #   byebug
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  #.end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  protected
# 退会しているかを判断するメソッド
  def user_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @user = User.find_by(account_name: params[:user][:account_name])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    
    if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == true)
      flash[:notice] = "このアカウントは現在利用できません。"
      redirect_to new_user_session_path
    end
  end
end

