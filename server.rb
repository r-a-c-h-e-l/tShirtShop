require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/item'
require_relative './lib/transaction'
require_relative './lib/user'
require_relative './lib/administrator'
require 'pry'
require 'bcrypt'
require 'json'

use Rack::Session::Pool, :cookie_only =>false

def authenticated?
  session[:valid_user] == true
end

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

get("/admin") do
  if authenticated?
    erb :"admin/admin", locals: {items: Item.all(), customers: User.all(), transactions: Transaction.all()}
  else
    redirect("/admin/login")
  end
end

get("/admin/login") do
  erb :"admin/login"
end

get ('/history/:id') do
  user = User.find_by({id: params[id]})
  
  # grab user that matches id
  #use user_id to cross reference the tranaction table and generate a transaction history for this user
  return "working on it!"
end

post("/transaction") do
  email = params["email"]
  first = params["first_name"]
  last = params["last_name"]
  p_qty = params["quantity"].to_i
  item_id = params["item_id"]
  verify = User.exists?(:email=> email)
  if verify
    this_user = User.find_by({email: email})
    p_item = Item.find_by({id: item_id})
    new_qty = p_item.qty - p_qty
    p_item.update({qty: new_qty })
    this_transaction = Transaction.create({
      item_id: p_item.item_id,
      user_id: this_user.user_id,
      purchase_qty: p_qty
      });
      this_transaction.update({transaction_id: this_transaction.zerogen(this_transaction.id)})
      erb :"transactions/trans", locals: {purchase: this_transaction}
  else
    this_user = User.create({
      firstName: first,
      lastName: last,
      email: email
      });
      this_user.update({user_id: this_user.zerogen(this_user.id)})
      p_item = Item.find_by({id: item_id})
      new_qty = p_item.qty - p_qty
      p_item.update({qty: new_qty })
      this_transaction = Transaction.create({
        item_id: p_item.item_id,
        user_id: this_user.user_id,
        purchase_qty: p_qty
        });
        this_transaction.update({transaction_id: this_transaction.zerogen(this_transaction.id)})
        erb :"transactions/trans", locals: {purchase: this_transaction}
    end
end

post ("/session") do
  username = params["username"]
  password = params["password"]

  verify = Administrator.exists?(:username => username)
  if verify
    admin = Administrator.find_by(username: username)
    if admin.password
      if BCrypt::Password.new(admin.password) == password
        puts "103"
        session[:valid_user]= true
        redirect("/admin")
      else
        erb :"admin/error"
      end
    else
      puts "90"
      this_password = BCrypt::Password.create(password)
      admin.update({password: this_password})
      session[:valid_user]= true
      redirect("/admin")
    end
  else
    erb :"admin/error"
  end
end
