class CreateElementElements < ActiveRecord::Migration
  def change
    create_table :element_elements do |t|
       t.integer :element_id
       t.integer :element_id
       t.timestamps
    end
     add_index :element_elements, :element_id
  
  end  
    
  
end
