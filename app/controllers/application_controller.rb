class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    homes_about_path
  end
  # ログイン、新規登録した後に最初にどこに遷移させるかを設定する記述
  # 引数の(resource)はログインを実行したモデルのデータのインスタンスが格納される
  
  def after_sign_out_path_for(resource)
    homes_about_path
  end  
  # ログアウトした後にどこに遷移させるかを設定する記述
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
