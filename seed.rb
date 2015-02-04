require 'pry'
require_relative './lib/connection'
require_relative './lib/item'
require_relative './lib/transaction'
require_relative './lib/administrator'
require_relative './lib/user'

9.times do |item|
  thing = Item.create({
    description: "Four loko tattooed Wes Anderson, food truck cardigan beard skateboard. Tattooed pop-up Banksy leggings synth church-key. Cold-pressed chillwave readymade disrupt, mlkshk before they sold out High Life Godard Vice umami Shoreditch Truffaut. Bushwick Pinterest shabby chic, church-key blog Helvetica kogi paleo small batch locavore.",
    item_type: "t-shirt",
    qty: 20,
    price: 24.00,
  });
  z = thing.update({item_id: thing.zerogen(thing.id)})
  thing.update({image_url: "/images/tshirt/#{thing.item_id}.jpg"})
  thing.update({name: "shirt#{thing.id}"})
end

Administrator.create({
  username: "rachel_hazes"
})

Administrator.create({
  username: "tiffany_poss"
})

Administrator.create({
  username: "genevieve_gorta"
})

Administrator.create({
  username: "shoshana_weisinger"
})
