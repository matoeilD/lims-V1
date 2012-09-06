class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  
  #above is the devise generated code
  
has_many :user_projects
has_many :projects, :through => :user_projects


has_many :user_elements
has_many :elements, :through => :user_elements
  
attr_accessible :email, :first_name, :name, :password, :role, :project_ids

validates_presence_of :name
validates_uniqueness_of :name

#for cancan
 ROLES = %w[admin user_extraction user_library user_sequencing user_bioinfo resp_sequencing resp_spectro resp_bioinfo chef_projet]





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
