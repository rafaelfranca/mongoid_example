class Task
  include Mongoid::Document

  field :description
  embedded_in :project, :inverse_of => :tasks

  validates_presence_of :description
end
