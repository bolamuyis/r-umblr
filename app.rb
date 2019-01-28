require "sinatra"
require_relative "models"


enable :sessions

get "/" do
  erb :home
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