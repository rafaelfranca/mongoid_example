class Project
  include Mongoid::Document

  field :name
  embeds_many :tasks
  references_and_referenced_in_many :participants, :inverse_of => :projects

  validates_presence_of :name
end
