class UserElement < ActiveRecord::Base
  belongs_to :user
  belongs_to :element
  # attr_accessible :title, :body
end
