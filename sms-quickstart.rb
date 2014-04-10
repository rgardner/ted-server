require 'sinatra'
require 'twilio-ruby'

get '/sms-quickstart' do
  sender = params[:From]
  friends = {
    '+14256149938' => 'Bob',
    '+19088948764' => 'Nicole'
  }
  name = friends[sender] || 'Mobile Monkey'
  twiml = Twilio::TwiML::Response.new do |r|
    r.Message "Hello, #{name}. Thanks for the message."
  end
  twiml.text
end
