class CreateUserProjects < ActiveRecord::Migration
  def change
    create_table :user_projects do |t|
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end
    add_index :user_projects, :project_id
    add_index :user_projects, :user_id
  end
      
end
