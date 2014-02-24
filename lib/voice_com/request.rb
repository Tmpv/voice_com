require 'net/http'

module VoiceCom
  class Request

    attr_accessor :smsid, :phone, :text, :op, :priority, :validity

    def initialize(args = {})

      @main_url = VoiceCom.config["service_url"]
      @sid      = VoiceCom.config["sid"]

      args.each {|k,v| instance_variable_set("@#{k}", v) unless k.blank?} 
      yield self if block_given?
      validate!
    end

    def send_message
      build_uri
      responce = Net::HTTP.get URI(@request_uri)
    end

    def build_uri
      url_string = "http://#{@main_url}?serviceID=#{@sid}&id=#{smsid}&msisdn=#{phone}&msg=#{text}"
      # url_string = "http://#{@main_url}?sid=#{@sid}&id=#{smsid}&msisdn=#{phone}&text=#{text}"
      url_str    = addition_attr_to_uri url_string

      @request_uri = URI.encode url_str
    end


    private

    def addition_attr_to_uri(str)
      str + "&" + ["op", "priority", "validity"].select{|x| instance_variable_get("@#{x}")}.map{|x| "#{x}" + "=" + instance_variable_get("@#{x}")}.join("&")
    end

    def validate!
      [:smsid, :phone, :text].each do |sym|
        raise ArgumentError, "Required attribute #{sym}" if send(sym).blank?
      end
      
    end
  end
end