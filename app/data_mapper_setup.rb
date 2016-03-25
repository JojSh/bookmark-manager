require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
#DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
