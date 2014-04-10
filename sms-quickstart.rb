require 'sinatra'
require 'twilio-ruby'

get '/sms-quickstart' do
  session['counter'] ||= 0
  sms_count = session['counter']
  if sms_count == 0
    message = 'Hello, thanks for the new message.'
  else
    message = "hello, thanks for message number #{sms_count + 1}"
  end
  twiml = Twilio::TwiML::Response.new do |r|
    r.Sms message
  end
  session['counter'] += 1
  twiml.text
end
