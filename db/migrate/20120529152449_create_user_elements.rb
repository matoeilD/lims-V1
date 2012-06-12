class CreateUserElements < ActiveRecord::Migration
  def change
    create_table :user_elements do |t|
      t.integer :user_id
      t.integer :element_id
      t.timestamps
      end
      add_index :user_elements, :user_id
      add_index :user_elements, :element_id
  end
  
 
  
end
