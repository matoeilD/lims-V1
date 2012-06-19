class ProjectElement < ActiveRecord::Base
belongs_to :project
belongs_to :element
attr_accessible :project_id, :element_id

  

end
