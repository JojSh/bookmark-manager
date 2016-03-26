require "data_mapper"
require "dm-postgres-adapter"
require "bcrypt"

class User

  include DataMapper::Resource

  attr_reader   :hash_password
  attr_accessor :password_confirmation


  property :id,     Serial
  property :email,  String, format: :email_address, required: true, unique: true
  property :password, Text


  def hash_password=(hash_password)
     @hash_password = hash_password
     self.password = BCrypt::Password.create(hash_password)
   end

  validates_confirmation_of :password
  validates_presence_of     :email
  # validates_format_of       :email, as: :email_address

end
