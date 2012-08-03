class CreateSpectros < ActiveRecord::Migration
  def change
    create_table :spectros do |t|
      t.string :spectro_name
      t.string :culture_assoc
      t.integer :element_id
      t.integer :probe_number
      t.string :analyse_type
      t.string :sample_type
      t.text :attached_files
      t.integer :samples_number
      t.integer :gel_number
      t.text :procedure
      t.text :comments

      t.timestamps
    end
  end
end
