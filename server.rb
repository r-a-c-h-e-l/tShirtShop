require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/item'
require_relative './lib/transaction'
require_relative './lib/user'
require 'pry'

after do
  ActiveRecord::Base.connection.close
end

get("/") do
  thing = Item.all()
  puts thing
  erb :"items/index", locals: {items: Item.all()}
end
