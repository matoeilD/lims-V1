class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |t|

      t.timestamps
    end
  end
  
   def self.down
    drop_table :user_projects
  end
  
end
