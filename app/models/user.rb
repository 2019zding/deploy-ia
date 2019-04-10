class User < ApplicationRecord
  #this will help with our password protection
  has_secure_password
  #this validation will ensure that an admin cannot  
  #create a new account with an email that has 
  #already previously been used to create an account
  validates_uniqueness_of :email
end
