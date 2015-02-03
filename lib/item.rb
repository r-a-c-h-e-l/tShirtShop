require "active_record"

class Item<ActiveRecord::Base
  has_many :transactions
  def zerogen(id)
    id = id.to_s
    zeronum = 4 - id.length
    zeroes = ""
    for i in 1..zeronum
      zeroes += "0"
    end
    return "T" + zeroes + id
  end
end
