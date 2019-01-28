require "sinatra"
require_relative "models"


enable :sessions

get "/" do
  erb :home
end


get '/home' do
  erb :home
end

post '/home' do
  User.create(
    first_name: params[:first_name],
    last_name: params[:last_name],	
    email: params[:email],
    dob: params[:dob],
    username: params[:username],
    password: params[:password]
  )
redirect '/home'
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

get "/users" do
  @users = User.all
  erb :users
end

get "/posts" do
  @posts = Post.all
  erb :posts
end