class User < ActiveRecord::Base
has_many :user_projects
has_many :projects, :through => :user_projects


has_many :user_elements
has_many :elements, :through => :user_elements
  
attr_accessible :email, :firstname, :name, :password, :position, :project_ids

validates_presence_of :name
validates_uniqueness_of :name

#validates_confirmation_of :login, :password
#validates_confirmation_of :email, :message => "should match confirmation"
#validates_format_of :email,:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,:on => :create


#def self.authenticate_safely(user_name, password)
#find(:first, :conditions =>
#[ "name = ? AND password = ?", name, password ])
#end


#accepts_nested_attributes_for :user_elements, :elements

#def display_name
#puts "#{name}"
#end

#scope :firstname


 def getresponsableUser
    array =Array.new
    
    User.all.each do |u|
      if u.position == "responsable"
         array.push(u.name)
      end
                  end
  return array
  end


end
