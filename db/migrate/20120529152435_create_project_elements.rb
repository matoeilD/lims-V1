class CreateProjectElements < ActiveRecord::Migration
  def change
    create_table :project_elements do |t|

      t.timestamps
    end
  end
  
   def self.down
    drop_table :project_elements
  end
  
end
