class User < Model
  attr_accessor :username, :password
  
  validates_presence_of :username, :password
  
  def authenticate!(session)
    if valid?
      client.authenticate!(@username, @password)
      session[:viddler_session_id] = client.sessionid if client.authenticated?
    end
  end
  
  private 
  
  def client
    @client ||= Viddler::Client.new('1bo1odc4du4nmcp1qx4w')
  end

end
