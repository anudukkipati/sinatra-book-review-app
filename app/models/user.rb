class User < ActiveRecord::Base
    has_secure_password
  
    validates :username, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    
    has_many :book_reviews
  end