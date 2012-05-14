require 'active_model'
require 'active_support'

class Model
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  def initialize(attributes = {})
    attributes.each { |name, value|
      send "#{name}=", value
    }
  end

  def persisted?
    false
  end

  def client
    @client ||= self.class.client
  end

  def self.client
    Viddler::Client.new(ViddlerIo::Application.config.viddler_api_key)
  end
end