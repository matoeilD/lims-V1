class Welldish < ActiveRecord::Base
  has_many :welldish_experiments
  has_many :experiments, :through => :welldish_experiments
  attr_accessible :welldishdimension, :welldishnote, :welldishtype
end
