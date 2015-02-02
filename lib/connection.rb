require "active_record"

ActiveRecord::Base.establish_connection({
  :adapter =>"sqlite3",
  :database =>"store.db",
  })

ActiveRecord::Base.logger = Logger.new(STDOUT)
