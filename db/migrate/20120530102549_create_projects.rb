class CreateProjects < ActiveRecord::Migration
 

def up
    create_table :projects do |t|
      t.string :projectname
      t.text :projectdescription
      t.string :colourcode
      t.references :user_id
      t.references :projecttype_id      
      t.timestamps
      
    end
    add_index :projects, :projecttype_id
  add_index :projects, :user_id

  end
  
  
  def self.down
    drop_table :projects
  end
end