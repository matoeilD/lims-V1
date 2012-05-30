class CreateUserElements < ActiveRecord::Migration
  def change
    create_table :user_elements do |t|

      t.timestamps
    end
  end
  
 def self.down
    drop_table :user_elements
  end
  
end
