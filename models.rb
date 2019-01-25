require 'sinatra/activerecord'
require 'pg'

# set :database, 'postgresql:rumbler-db'

configure :development do
    set :database, 'postgresql:rumbler-db'
end

# configure :development do
    # set :database, ENV['DATABASE_URL']
# end
  

class User < ActiveRecord::Base
end