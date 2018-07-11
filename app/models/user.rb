class User < ActiveRecord::Base  
  devise :database_authenticatable,
         :confirmable,  
         :registerable,
         :recoverable,
         :rememberable,
         :trackable, 
         :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :projects
  has_many :tasks, through: :projects
  has_many :tags
end
