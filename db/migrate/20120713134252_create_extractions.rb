class CreateExtractions < ActiveRecord::Migration
  def change
    create_table :extractions do |t|
      t.string :extractionname
      t.integer :element_id
      t.integer :culture_id
      t.text :extractionnote

      t.timestamps
    end
  end
end
