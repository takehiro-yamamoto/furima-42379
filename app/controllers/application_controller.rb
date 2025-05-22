class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? # Deviseのコントローラの場合のみ実行
  before_action :basic_auth

  private

  # Strong Parameters
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
                                        :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date
                                      ]) # ユーザー新規登録の際にparams以外の指定カラムを許可する
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end
end
