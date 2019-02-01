require "sinatra"
require_relative "models"
require "sinatra/activerecord"

enable :sessions

get "/" do
  erb :home
end

get '/home' do
  erb :home
end

post '/home' do
  new_user = User.create(
    first_name: params[:first_name],
    last_name: params[:last_name],	
    email: params[:email],
    dob: params[:dob],
    username: params[:username],
    password: params[:password]
  )
session[:user_id] = new_user.id

redirect '/home'
end

get '/posts' do
  erb :posts
end

post '/posts' do
  @user = User.find(session[:user_id])
  Post.create(
    title: params[:title],
    content: params[:content],
    user_id: @user.id,
    #image_url: t.string[:image_url],                                                                                                                                                                
    datetime: Time.now
  )
  redirect '/animals'
end

get '/people' do 
    erb :people
end

get '/cities' do
    erb :cities
end

get '/animals' do
    @posts = Post.all
    @user = User.find_by(id: session[:user_id])

    erb :animals
end

get '/users' do
    @users = User.all
    erb :users
end

get '/logout' do
  session[:user_id] = nil
  
  redirect '/home'
end

post '/animals' do
  erb :animals
end