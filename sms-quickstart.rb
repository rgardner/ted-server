require 'rubygems'
require 'sinatra'
require 'twilio-ruby'

enable :sessions

get '/sms-quickstart' do
  session['counter'] ||= 0
  sms_count = session['counter']
  if sms_count == 0
    message = 'Hello, thanks for the new message.'
  else
    message = "hello, thanks for message number #{sms_count + 1}"
  end
  Twilio::TwiML::Response.new do |r|
    r.Sms message
  end.text
  session['counter'] += 1
end
