class UserProject < ActiveRecord::Base
belongs_to :user
belongs_to :project


attr_accessible :user_id, :project_id

def display_name
  "#{name}"
end

end
