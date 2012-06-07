class CreateProjects < ActiveRecord::Migration
 

def up
    create_table :projects do |t|
      t.string :projectname
      t.text :projectdescription
      t.string :colourcode
      t.string :projectheader
      t.string :projectmember
      t.string :projecttypename      
    end
  end
  
  
  def self.down
    drop_table :projects
  end
end