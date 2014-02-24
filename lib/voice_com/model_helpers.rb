module VoiceCom
  module ModelHelpers
    def uniq_sms_id
      
      if uniq_column_id
        send(uniq_column_id)
      else
        self.class.name.gsub(/[a-z]/, "").downcase + id.to_s
      end

    end

    def uniq_column_id
      #custome column for the uniq sms id, given in the config file
      #when non given uses the first 2 upcase letter of the model  + 'id' column in the database 

      VoiceCom.config["sms_uniq_id_column"]
    end
  end
end