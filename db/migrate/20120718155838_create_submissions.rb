class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :submission_name
      t.string :submission_center
      t.string :submission_type
      t.string :accession_number
      t.string :bioproject_id
      t.integer :element_id
      t.string :sequencing_assoc
      t.text :submission_note
      

      t.timestamps
    end
  end
end
