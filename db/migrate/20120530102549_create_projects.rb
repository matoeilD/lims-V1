class CreateProjects < ActiveRecord::Migration
 

def change
    create_table :projects do |t|
      t.string :project_name
      t.text :project_description
      t.integer :numero_smartlab
      t.integer :numero_id_interne
      t.integer :project_type_id
      t.integer :user_id
      t.integer :element_id      
    end
    add_index :projects, :project_type_id
    add_index :projects, :user_id
    add_index :projects, :element_id 
  end
  

end