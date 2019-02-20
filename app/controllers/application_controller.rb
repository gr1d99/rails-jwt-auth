class ApplicationController < ActionController::API
  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def generate_auth_token(user)
    payload = { email: user.email }
    JwtToken::JwtToken.encode(payload, user_params[:password])
  end

  def attach_auth_token(token)
    headers["x-access-token"] = token
  end
end
