class Experiment < ActiveRecord::Base
  
  belongs_to :element
  
  has_many :welldish_experiments
  has_many :welldishs, :through => :welldish_experiments

  attr_accessible :exptype, :resultfile
end
