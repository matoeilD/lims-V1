class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :lastname
      t.string :firstname
      t.string :email
      t.string :password
      t.string :position

      t.timestamps
    end
  end
  
   def self.down
    drop_table :users
  end
  
end

