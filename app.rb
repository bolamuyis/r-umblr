require "sinatra"
require_relative "models"

enable :sessions

get "/" do
  erb :home
end

post "/home" do
  user_user = User.create(
    username: params[:username],
    password: params[:password]
  )
  # logs in new user
  session[:user_id] = user_user.id

  redirect "/"
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


get '/logout' do
  session[:user_id] = nil

  redirect "/users"
end