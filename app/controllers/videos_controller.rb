class VideosController < ApplicationController
  def new
    @upload = Upload.new.prepare!(session[:viddler_session_id])
  end

  def index
    @videos = Video.find_all(session[:viddler_session_id])
  end

  def show
    @video = Video.find(session[:viddler_session_id], params[:id]).embed!
  end

  def destroy
    Video.destroy(session[:viddler_session_id], params[:id])
    render :json => {:id => params[:id]}
  end
end
