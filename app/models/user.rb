class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true
    validates :name, presence: true
    validates :username, presence: true
    validates(:password, { :length => { :in => 6..20 } })
    has_many :items
    has_many :transactions, through: :items
    
end
