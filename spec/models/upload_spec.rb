require 'spec_helper'

describe Upload do
  let(:session_id) { 'fake_session_id' }

  before do
    stub_prepare_upload(:sessionid => session_id)
  end

  it 'prepares a new video upload' do
    upload = Upload.new.prepare!(session_id)
    upload.endpoint.should == 'http://localhost/upload_endpoint'
    upload.token.should == 'token'
  end
end
