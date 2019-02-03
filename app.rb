require "sinatra"
require 'sinatra/flash'
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
  flash[:info] = 'you have signed up'
  redirect '/login'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if (@user && @user.password == params[:password])
    session[:user_id] = @user.id
    redirect '/articles'
  end
  erb :error
end


get '/error' do
  erb :error
end

get '/sign_up' do
  erb :sign_up
end

get '/posts' do
  erb :posts
end

get '/not_login' do
  erb :not_login
end

post '/posts' do
    @user = User.find_by(id: session[:user_id])
      if @user.nil?
        flash[:info] = "You have not been logged in"
        redirect '/not_login'
      
      erb :posts
    end
    @post = Post.create(
    title: params[:title],
    content: params[:content],
    user_id: @user.id,
    username: @user.username,
    image_url: params[:image_url],                                                                                                                                                              
    datetime: Time.now
  )
  redirect '/articles'
end

get '/login' do
  erb :login
end

get '/people' do 
    erb :people
end

get '/cities' do
    erb :cities
end

get '/articles' do
    @posts = Post.all
    @user = User.find_by(id: session[:user_id])

    erb :articles
end

get '/users' do
    @users = User.all
    erb :users
end

get '/logout' do
  session[:user_id] = nil
  
  redirect '/home'
end

post '/articles' do
  erb :articles
end