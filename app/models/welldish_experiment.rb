class WelldishExperiment < ActiveRecord::Base
belongs_to :welldish
belongs_to :experiment
  
attr_accessible :welldish_id, :experiment_id
end
