require "active_record"

class Transaction<ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  def zerogen(id)
    id = id.to_s
    zeronum = 6 - id.length
    zeroes = ""
    for i in 1..zeronum
      zeroes += "0"
    end
    return "p" + zeroes + id
  end
end
