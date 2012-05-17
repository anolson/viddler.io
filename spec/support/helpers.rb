module Helpers
  def stub_get_videos_by_user(params = {})
    Viddler::Client.any_instance.stubs(:get).with('viddler.videos.getByUser', params).returns({ 'list_result' => { 'video_list'=> [] } })
  end
  
  def stub_prepare_upload(params = {})
    Viddler::Client.any_instance.stubs(:get).with('viddler.videos.prepareUpload', params).returns({ 'upload' => { 'endpoint'=> 'http://localhost/upload_endpoint', 'token' => 'token' } })
  end
end