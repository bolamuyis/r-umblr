require 'sinatra/activerecord'
require 'pg'

set :database, 'postgresql:rumblr-db'

class User < ActiveRecord::Base
end