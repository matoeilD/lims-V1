class CreateProjecttypes < ActiveRecord::Migration
  def change
    create_table :projecttypes do |t|
      t.string :projecttypename

      t.timestamps
    end
  end
  
   def self.down
    drop_table :projecttypes
  end
end

