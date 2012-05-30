class CreateWelldishExperiments < ActiveRecord::Migration
  def change
    create_table :welldish_experiments do |t|

      t.timestamps
    end
  end
  
  
  def self.down
    drop_table :welldish_experiments
  end
  
end
