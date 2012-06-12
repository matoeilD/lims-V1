class CreateWelldishExperiments < ActiveRecord::Migration
  def change
    create_table :welldish_experiments do |t|
        t.integer :welldish_id
        t.integer :experiment_id
        t.timestamps
    end
         add_index :welldish_experiments, :welldish_id
         add_index :welldish_experiments, :experiment_id
  end
    
end
