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

get("/admin") do
  erb :"admin/admin", locals: {items: Item.all(), }
end

post("/transaction") do
  email = params["email"]
  first = params["first_name"]
  last = params["last_name"]
  p_qty = params["quantity"].to_i
  item_id = params["item_id"]
  verify = User.exists?(:email=> email)
  puts verify
  if verify
    this_user = User.find_by({email: email})
    puts this_user
    p_item = Item.find_by({id: item_id})
    new_qty = p_item.qty - p_qty
    p_item.update({qty: new_qty })
    puts p_item
    this_transaction = Transaction.create({
      item_id: p_item.item_id,
      user_id: this_user.email,
      purchase_qty: p_qty
      });
      puts this_transaction
      this_transaction.update({transaction_id: this_transaction.zerogen(this_transaction.id)})
      puts this_transaction
      erb :"transactions/trans", locals: {purchase: this_transaction}
  else
    this_user = User.create({
      firstName: first,
      lastName: last,
      email: email
      });
      puts this_user
      p_item = Item.find_by({id: item_id})
      new_qty = p_item.qty - p_qty
      p_item.update({qty: new_qty })
      puts p_item
      this_transaction = Transaction.create({
        item_id: p_item.item_id,
        user_id: this_user.email,
        purchase_qty: p_qty
        });
        puts this_transaction
        this_transaction.update({transaction_id: this_transaction.zerogen(this_transaction.id)})
        puts this_transaction
        erb :"transactions/trans", locals: {purchase: this_transaction}
    end
end
