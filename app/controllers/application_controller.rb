class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :current_user
  before_filter :authenticate

  def current_user
    @current_user ||= session[:current_user]
  end

  def authenticate
    redirect_to login_path unless @current_user
  end
end
