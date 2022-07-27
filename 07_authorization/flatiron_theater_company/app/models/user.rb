class User < ApplicationRecord
    has_many :tickets
    has_many :productions, through: :tickets
    validates :username, uniqueness: true, presence: true
    has_secure_password
end
