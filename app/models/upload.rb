class Upload < Model
  attr_accessor :endpoint, :token

  def prepare!(session_id)
    upload = client.get 'viddler.videos.prepareUpload', :sessionid => session_id
    @endpoint = upload['upload']['endpoint']
    @token = upload['upload']['token']
    self
  end
end
