class ElementElement < ActiveRecord::Base
belongs_to :Element
attr_accessible :element_ids
end
