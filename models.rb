require 'sinatra/activerecord'
require 'pg'

set :database, 'postgresql:rumbler-db'

class User < ActiveRecord::Base
end