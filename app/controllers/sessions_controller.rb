class SessionsController < ApplicationController
  skip_before_filter :authenticate
  rescue_from Viddler::ApiException, :with => :force_sign_in
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.valid?
      @user.authenticate!(session)
      redirect_to videos_path
    else
      render :new
    end
  end
  
  def destroy
    redirect_to_login
  end

  private
  
  def force_sign_in
    redirect_to_login "Incorrect Username/Password"
  end

  def redirect_to_login(alert = nil)
    reset_session
    redirect_to login_path, :alert => alert
  end
end
