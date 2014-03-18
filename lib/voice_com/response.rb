module VoiceCom
  class Response
    
    attr_accessor :sid, :dlr, :answer, :to, :from, :ts, :smsID, :voicecom_id
    attr_reader :answer_hash

    def initialize(args = {})
      args.each do |k,v|
        k = k.strip.gsub("\s", "")
        instance_variable_set("@#{k.strip}", v)
      end
      yield self if block_given?
      validate!
      parse_answer
    end

    def sms_id
      @dlr
    end

    def parse_answer
      @answer_hash = get_answer
    end

    def get_answer
      Hash[@answer.split("+").map{|x| x.split(":")}]
    end


    def success?
      dlr.to_i == 1
    end

    private

    def validate!
      [:sid, :dlr, :answer, :to, :from, :ts, :smsID, :voicecom_id].each do |x|
        raise ArgumentError, "Request attribute #{x}" if instance_variable_get("@#{x}").blank?
      end
    end
  end
end