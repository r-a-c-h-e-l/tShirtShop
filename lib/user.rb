require "active_record"

class User<ActiveRecord::Base
  has_many :transactions
  def zerogen(id)
    id = id.to_s
    zeronum = 6 - id.length
    zeroes = ""
    for i in 1..zeronum
      zeroes += "0"
    end
    return "c" + zeroes + id
  end
end
