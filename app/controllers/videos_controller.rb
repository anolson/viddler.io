class VideosController < ApplicationController
  def new
    @upload = Upload.new.prepare!(current_user[:viddler_session_id])
  end

  def index
    @videos = Video.find_all(current_user[:viddler_session_id])
  end

  def show
    @video = Video.find(current_user[:viddler_session_id], params[:id]).embed!
  end

  def destroy
    Video.destroy(current_user[:viddler_session_id], params[:id])
    render :json => {:id => params[:id]}
  end
  
  def callback
    redirect_to video_path(:id => params[:videoid])
  end
end
