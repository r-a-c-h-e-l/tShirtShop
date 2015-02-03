require "active_record"
require "pry"

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
  def self.exists?(email)
    verify = User.find_by({email: email})
    binding.pry
    if verify.length > 0
      return true
    else
      return false
    end
  end
end
