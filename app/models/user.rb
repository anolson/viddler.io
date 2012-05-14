class User < Model
  attr_accessor :username, :password, :viddler_session_id

  validates_presence_of :username, :password

  def authenticate!(session)
    if valid?
      client.authenticate!(@username, @password)
      self.viddler_session_id = client.sessionid
      setup_session(session) if client.authenticated?
    end
  end

  def setup_session(session)
    session[:current_user] = { :username => username, :viddler_session_id => viddler_session_id }
  end
end
