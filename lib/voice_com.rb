require "voice_com/version"
require "voice_com/request"
require "voice_com/response"
require "voice_com/model_helpers"

require 'voice_com/railtie' if defined? Rails

module VoiceCom
  class << self

    def config=(conf)
      @@config = conf
    end
    
    def config
      @@config[Rails.env]
    end

    def uri_query_string_to_hash(uri)
      Hash[uri.query.split('&').map{|x| URI.decode(x).split('=')}].symbolize_keys
    end
  end
end
