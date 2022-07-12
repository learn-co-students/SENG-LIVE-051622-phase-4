class User < ApplicationRecord
    has_many :tickets
    has_many :productions, through: :tickets

    has_secure_password
end
