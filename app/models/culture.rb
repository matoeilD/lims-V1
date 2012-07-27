class Culture < ActiveRecord::Base
  
  belongs_to :element  
  attr_accessible :culture_name, :host_strain, :culture_note
  #accepts_nested_attributes_for :element


def self.eltpara
  hello
end
  
end