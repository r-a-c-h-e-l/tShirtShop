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

get("/item/:id") do
   item = Item.find_by({id: params[:id]})
   erb :"items/show", locals: {item: item}
end

post("/transaction") do
  email = params["email"]
  first = params["first_name"]
  last = params["last_name"]
  qty = params["quantity"]
  item_id = params["item_id"]
  def exists?(email)
    verify = User.find_by({email: email})
    if verify
      return true
    else
      return false
    end
  end
  verify = exists?(email)
  puts verify
end
