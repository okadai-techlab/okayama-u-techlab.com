require 'sinatra'
require 'sinatra/reloader' if development?
require 'pony'

get '/' do
  erb :index
end

post '/' do
  Pony.mail(:to => 'yuta.totz@gmail.com', :from => 'me@example.com', :subject => 'hi', :body => 'Hello there.', :via => :sendmail)
  redirect '/'
end
