class Project
  include Mongoid::Document

  field :name
  embeds_many :tasks

  validates_presence_of :name
end
