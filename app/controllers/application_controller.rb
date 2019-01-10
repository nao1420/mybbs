class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user! #protect_from_forgery with: :exceptionより後におく。

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :username, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:sign_in, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    #devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  #protected
  #def permitted_params
#    params.permit(:options)
#  end

  protect_from_forgery

  before_action :set_locale
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def

  # トップレベルドメインからロケールを取得する、なければ+nil+を返す
# この動作をローカルPCで行なうためには、
#   127.0.0.1 application.com
#   127.0.0.1 application.it
#   127.0.0.1 application.pl
# /etc/hosts上のように記述する必要がある
  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

end
