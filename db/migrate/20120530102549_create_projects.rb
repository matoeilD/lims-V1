class CreateProjects < ActiveRecord::Migration
 

def change
    create_table :projects do |t|
      t.string :projectname
      t.text :projectdescription
      t.integer :projecttype_id
      t.integer :user_id
      t.integer :element_id      
    end
    add_index :projects, :projecttype_id
    add_index :projects, :user_id
    add_index :projects, :element_id 
  end
  

end