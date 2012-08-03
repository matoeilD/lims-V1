class CreateExtractions < ActiveRecord::Migration
  def change
    create_table :extractions do |t|
      t.string :extraction_name
      t.integer :element_id
      t.string :culture_assoc
      t.text :extraction_note

      t.timestamps
    end
  end
end
