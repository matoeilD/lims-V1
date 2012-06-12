class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :exptype
      t.string :resultfile
      t.integer :element_id
      t.timestamps
    end
    add_index :experiments, :element_id
  end
  
    
end
