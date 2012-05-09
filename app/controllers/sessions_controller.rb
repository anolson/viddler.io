class SessionsController < ApplicationController
  
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
  
  private
  
  def force_sign_in
    redirect_with_alert "Incorrect Username/Password"
  end

  def redirect_with_alert(alert)
    reset_session
    redirect_to login_path, :alert => alert
  end
end
