require 'spec_helper'

describe VideosController do
  describe "GET index" do
    it "assigns @videos" do
      get :index
      assigns(:videos).should_not == nil
    end
  end
  
  
  describe "GET new" do
    it "assigns @upload" do
      get :new
      assigns(:upload).should_not == nil
    end
  end
  
end
