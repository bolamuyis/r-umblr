require "sinatra"
require_relative "models"
require 'sendgrid-ruby'
include SendGrid


get "/" do
    erb :home
end


get "/users" do 
  @users = User.all
  erb :users
end


get "/people" do 
    erb :people
end


get "/cities" do
    erb :cities
end


get "/animals" do
    erb :animals
end


post "/" do
  from = SendGrid::Email.new(email: 'bolamuyis@gmail.com')
  to = SendGrid::Email.new(email: params[:email])
  subject = params[:name]
  content = SendGrid::Content.new(
    type: 'text/html',
    value: 
  "Damn Bola"
  )
  # create mail object with from, subject, to and content
  mail = SendGrid::Mail.new(from, subject, to, content)
  sg = SendGrid::API.new(api_key: ENV["SENDGRID_API_KEY"])
  # sends the email
  response = sg.client.mail._('send').post(request_body: mail.to_json)

  # display http response code
  puts response.status_code

  # display http response body
  puts response.body

  # display http response headers
  puts response.headers

  redirect "/"
end

get "/" do
  erb :home
end