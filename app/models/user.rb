require 'pry'
require "data_mapper"
require "dm-postgres-adapter"
require "bcrypt"

class User

  include DataMapper::Resource

  attr_reader   :password
  attr_accessor :password_confirmation


  property :id,     Serial
  property :email,  String, format: :email_address, required: true, unique: true
  property :password_hash, Text


  validates_confirmation_of :password
  validates_presence_of     :email

  def password=(password)
     @password = password
     self.password_hash = BCrypt::Password.create(password)
   end

   def self.authenticate(email, password)
     user = first(email: email)
     if user && BCrypt::Password.new(user.password_hash) == password
       user
     else
       nil
     end
   end

  # validates_format_of       :email, as: :email_address

end
