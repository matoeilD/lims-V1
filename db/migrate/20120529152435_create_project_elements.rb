class CreateProjectElements < ActiveRecord::Migration
  def change
    create_table :project_elements do |t|
      t.integer :project_id
      t.integer :element_id
      t.timestamps
    end
    add_index :project_elements, :project_id
    add_index :project_elements, :element_id
  end  
  
end
