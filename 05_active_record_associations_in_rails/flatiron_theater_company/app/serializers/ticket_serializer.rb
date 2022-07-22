class TicketSerializer < ActiveModel::Serializer
  attributes :id, :price, :production
  # has_one :production

  # customize production that is going to return just the production title

  def production 
    { title: self.object.production.title} # i want to return the production title associated with the ticket
  end
end


