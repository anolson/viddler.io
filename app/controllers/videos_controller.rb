class VideosController < ApplicationController
  def new
    @upload = Upload.new.prepare!(current_user[:viddler_session_id])
  end

  def index
    @videos = Video.page(current_user[:viddler_session_id], page, per_page)
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

  def all
    @videos = Video.all(current_user[:viddler_session_id])
    render :index
  end

  private

  def page
    @page = (params[:page] || 1).to_i
  end

  def per_page
    @per_page = 10
  end
end
