class CreateElementElements < ActiveRecord::Migration
  def change
    create_table :element_elements do |t|

      t.timestamps
    end
  end
  
  def self.down
    drop_table :element_elements
  end
  
end
