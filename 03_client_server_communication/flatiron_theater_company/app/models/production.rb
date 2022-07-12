class Production < ApplicationRecord
    validates :title, presence: true
    validates :budget, numericality: {greater_than: 0}
end
