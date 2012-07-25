class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.string :data_name
      t.text :data_file
      t.integer :sequencing_id
      t.integer :element_id

      t.timestamps
    end
  end
end
