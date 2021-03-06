module VoiceCom
  class Railtie < Rails::Railtie
    initializer "voice_com.model_helpers" do
      ActiveRecord::Base.send :include, ModelHelpers
    end

    initializer "voice_com.config_initialize" do
      VoiceCom.config = YAML.load_file Rails.root.join('config', 'voicecom_config.yml').to_s
    end
  end
end