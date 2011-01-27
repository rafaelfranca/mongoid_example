class Participant
  include Mongoid::Document

  field :name

  references_and_referenced_in_many :projects, :inverse_of => :participants
end
