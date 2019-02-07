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

get '/login' do
  erb :login
end

post '/logged_in' do
  new_user = User.create(
    first_name: params[:first_name],
    last_name: params[:last_name],	
    email: params[:email],
    dob: params[:dob],
    username: params[:username],
    password: params[:password],
    datetime: Time.now
  )
session[:user_id] = new_user.id
  redirect '/logged_in'
end

post '/error' do
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
    first_name: @user.first_name,
    last_name: @user.last_name,
    image_url: params[:image_url],                                                                                                                                                              
    created_at: Time.now
  )
  redirect '/articles'
end

get '/logged_in' do
  @user = User.find_by(id: session[:user_id])
  erb :logged_in
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

# show post
get '/post/:id' do
	@post = Post.find(params[:id])
	erb :post_page
end

# update post
put '/post/:id' do
	@post = Post.find(params[:id])
	@post.update(title: params[:title], content: params[:body])
	@post.save
	redirect '/articles'
end

 # delete post
 get '/delete/:post_id' do
  @post = User.find_by(id: session[:user_id])
  @post = Post.find_by(id: params[:post_id])
	@post.destroy
	redirect '/articles'
end

get '/user' do
  @user = User.find_by(id: session[:user_id])
  @posts = Post.find_by(id: params[:post_id])
  erb :user
end

get '/delete_account' do
  @user = User.find_by(id: session[:user_id])
  @user.destroy
  session[:user_id] = nil
  redirect '/'
end

post '/delete_account' do
  @user = User.find_by(id: session[:user_id])
  @user.destroy
  session[:user_id] = nil
  redirect '/'
end