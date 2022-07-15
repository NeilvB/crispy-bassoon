class User < ActiveRecord::Base
  has_many :courses_users
  has_many :courses, through: :courses_users
  
  has_secure_password
end
