require 'spec_helper'

describe User do
  let(:username) { 'bob' }
  let(:password) { 'password' }
  let(:invalid) { 'invalid' }
    
  it "raises an error for invalid authentication" do
    Viddler::Client.any_instance.stubs(:authenticate!).raises(StandardError)
    user = User.new(username: username, password: invalid)
    lambda { user.authenticate!({}) }.should raise_error(StandardError)  
  end
  
  it "authenticates a valid user" do
    Viddler::Client.any_instance.stubs(:authenticate!).returns
    user = User.new(username: username, password: password)
    lambda{ user.authenticate!({}) }.should_not raise_error
  end
end
