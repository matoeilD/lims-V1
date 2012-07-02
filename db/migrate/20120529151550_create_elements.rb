class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :elementname
      t.string :elementtype
      t.text :elementnote
      t.integer :user_id
      t.integer :element_id
      t.integer :project_id
      t.timestamps
    end
      add_index :elements, :user_id
      add_index :elements, :element_id
      add_index :elements, :project_id
     
       
  end
    
end

