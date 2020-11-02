class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [nickname, last_name, first_name, last_name_kana, first_name_kana, birthday,])
  #ログイン時のmailとpassword以外のカラムのストロングパラメータを設定
  end
end
