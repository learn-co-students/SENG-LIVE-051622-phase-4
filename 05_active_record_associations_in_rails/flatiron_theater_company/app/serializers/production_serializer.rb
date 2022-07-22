class ProductionSerializer < ActiveModel::Serializer
  attributes :id, :title, :director, :ongoing, :image, :genre, :budget
  has_many :cast_members

  def ongoing
    object.ongoing ? "Currently Playing" : "Not Playing"
  end
end
