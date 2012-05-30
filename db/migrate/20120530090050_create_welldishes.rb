class CreateWelldishes < ActiveRecord::Migration
  def change
    create_table :welldishes do |t|
      t.string :welldishtype
      t.text :welldishnote
      t.string :welldishdimension

      t.timestamps
    end
  end
  
  def self.down
    drop_table :welldishes
  end
  
end
