class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? # Deviseのコントローラの場合のみ実行
  
  private
  # Strong Parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date
    ])# ユーザー新規登録の際にparams以外の指定カラムを許可する
    
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date
    ])# ユーザー情報更新の際にparams以外の指定カラムを許可する 
  end
end