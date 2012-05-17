require 'spec_helper'

describe VideosController do
  let(:session_id) { 'fake_session_id' }

  before do
    session[:current_user] = { :username => 'anolson', :viddler_session_id => session_id }
  end

  describe "GET index" do
    it "assigns @videos" do
      Video.expects(:page).returns([])
      get :index
      assigns(:videos).should_not be_nil
    end
  end

  describe "GET new" do
    it "assigns @upload" do
      Upload.any_instance.stubs(:prepare!).returns(Upload.new)
      get :new
      assigns(:upload).should_not == nil
    end
  end
end
