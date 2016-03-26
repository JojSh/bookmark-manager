require "data_mapper"
require "dm-postgres-adapter"
require "bcrypt"

class User

  include DataMapper::Resource

  property :id,       Serial
  property :email,    String
  property :password, Text


  def hash_password=(hash_password)
     self.password= BCrypt::Password.create(hash_password)
   end

end
