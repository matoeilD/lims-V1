class CreateExperiments < ActiveRecord::Migration
  def change
    create_table :experiments do |t|
      t.string :exptype
      t.string :resultfile

      t.timestamps
    end
  end
  
  def self.down
    drop_table :experiments
  end
  
  
end
