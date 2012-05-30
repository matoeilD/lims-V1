class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.references :experiment
      t.text :elementnote
      t.references :user
      t.references :user
      t.references :element

      t.timestamps
    end
    add_index :elements, :experiment_id
    add_index :elements, :user_id
    add_index :elements, :element_id
  end
  
   def self.down
    drop_table :elements
  end
  
end

