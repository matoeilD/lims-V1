class WelldishExperiment < ActiveRecord::Base
  belongs_to :welldish
  belongs_to :experiment
  
  # attr_accessible :title, :body
end
