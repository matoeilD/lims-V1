class ProjectElement < ActiveRecord::Base
  belongs_to :project
  belongs_to :element
  # attr_accessible :title, :body
end
