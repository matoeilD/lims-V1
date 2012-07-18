class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :submission_name
      t.string :seize_s
      t.string :genbank_number
      t.integer :element_id
      t.integer :sequencing_id

      t.timestamps
    end
  end
end
