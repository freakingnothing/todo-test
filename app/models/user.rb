class User < ActiveRecord::Base  
  devise :database_authenticatable,
         :confirmable,  
         :registerable,
         :recoverable,
         :rememberable,
         :trackable, 
         :validatable

  include DeviseTokenAuth::Concerns::User
end
