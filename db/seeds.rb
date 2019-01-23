# db/seeds.rb
# we require our models here
require_relative "../models"

# in this file we can make use of our ActiveRecord models to create starter data
#   such as some default users for our app
User.create(
    username: "bola", 
    password: "12345"
    )