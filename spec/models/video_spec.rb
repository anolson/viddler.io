require 'spec_helper'

describe Video do
  let(:session_id) { 'fake_session_id' }
  let(:page) { 1 }
  let(:per_page) { 10 }

  before do
    stub_get_videos_by_user(:sessionid => session_id, :page => page, :per_page => per_page)
  end

  it 'gets the first page of videos' do
    Video.page(session_id, page, per_page).should == []
  end
end
