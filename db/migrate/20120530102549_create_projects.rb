class CreateProjects < ActiveRecord::Migration
 

def change
    create_table :projects do |t|
      t.string :project_name
      t.text :project_description
      t.integer :numero_smartlab
      t.string :identifiant_interne
      t.integer :project_type_id
      t.integer :user_id
      t.integer :element_id      
    end   
   
  end
  

end