require 'pry'
require_relative './lib/connection'
require_relative './lib/item'
require_relative './lib/transaction'
require_relative './lib/user'

9.times do |item|
  thing = Item.create({
    item_type: "t-shirt",
    qty: 20,
    price: 24.00,
  });
  z = thing.update({item_id: thing.zerogen(thing.id)})
  thing.update({image_url: "./public/images/#{thing.item_id}.jpg"})
end
