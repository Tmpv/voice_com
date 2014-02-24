# VoiceCom

TODO: Write a gem description

This is a simple API for working with the bulgarian VoiceCom AD service.

At this moment only usable with Rails.

Add this line to your application's Gemfile:

    gem 'voice_com'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install voice_com

## Usage

After installing the gem. You have to create a configuration config/voicecom_config.yml.

A template is give in the gem's repository in templates/voicecom_config.yml.

## Request 
  
  Creating a request object:

    request = VoiceCom::Request.new request_attr

  Attribute accepted by a request object:

  smsid*   : Unique id of the sms **message

  phone*   : Phone number of the receiver

  text*    : The sort text message of the request

  op       : Mobile operator, if none given it will be determined by the phone number

  priority : 1 - height priority / 2 - lower priority

  validity : Sets the short message validity period, default 24 hours

  ** VoiceCom gem builds in an ActiveRecord instance method, with gives an unique sms id,
  created from the records 'database id column' and prefixed with the uppercase letter in the ActiveRecord Class name.

  The config file accepts and an addition value(sms_uniq_id_column). If given the 'uniq_sms_id' return the value in this column.

  Sending the message:

    request.send_message

  The method returns a response string, check VoiceCom documentation for more details.

  Creating a response object:

    response = VoiceCom::Response.new response_attr

  Attributes for creating a response object:
    :sid, :dlr, :answer, :to, :from, :ts, :smsID, :voicecom_id

  For more information see VoiceCom documentation.



## Response



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request