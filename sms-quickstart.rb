require 'sinatra'
require 'twilio-ruby'

get '/sms-quickstart' do
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message 'Hey Monkey. Thanks for the message'
  end
  twiml.text
end
