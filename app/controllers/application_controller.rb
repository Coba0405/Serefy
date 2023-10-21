class ApplicationController < ActionController::Base
  before_action :authenticate_user!, if: :use_auth?
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    root_path
  end
  # ログイン、新規登録した後に最初にどこに遷移させるかを設定する記述
  # 引数の(resource)はログインを実行したモデルのデータのインスタンスが格納される
  
  def after_sign_out_path_for(resource)
    root_path
  end  
  # ログアウトした後にどこに遷移させるかを設定する記述
  
  protected
  
  def configure_permitted_parameters
    # binding.pry
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :account_name, :last_name, :first_name, :last_name_kana, :first_name_kana, :gender, :age_groups])
    #↑フォームで送るカラムの許可
  end
  
  private

  def use_auth?
    # byebug
    if !admin_signed_in?
      # 否定演算子でアドミンがサインインしている時falseが返される
      if controller_name == 'homes' && (action_name == 'top' || action_name == 'about')
        false
      elsif controller_name == 'groups' && (action_name == 'index' || action_name == 'show')
        false
      elsif controller_name == 'posts' && (action_name == 'index' || action_name == 'show')
        false
      elsif controller_name == 'users' && (action_name == 'show' || action_name == 'likes_post')
        false
      elsif controller_name == 'sessions' && (action_name == 'create' || action_name == 'new')
        false
      else
        true
      end
    end
  end
end
