class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :first_name
     
      t.string :role
      t.text :user_note

      t.timestamps
    end
  end 
   
  
end

