class UserSerializer < ActiveModel::Serializer
  attributes :name
  has_many :tickets
  has_many :productions
end
