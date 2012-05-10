class User < Model
  attr_accessor :username, :password

  validates_presence_of :username, :password

  def authenticate!(session)
    if valid?
      client.authenticate!(@username, @password)
      session[:viddler_session_id] = client.sessionid if client.authenticated?
    end
  end
end
