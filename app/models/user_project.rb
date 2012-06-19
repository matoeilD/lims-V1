class UserProject < ActiveRecord::Base
belongs_to :user
belongs_to :project

#accepts_nested_attributes_for :projects
  # attr_accessible :title, :body
attr_accessible :user_id, :project_id

def display_name
  "#{name}"
end

end
