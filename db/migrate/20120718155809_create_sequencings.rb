class CreateSequencings < ActiveRecord::Migration
  def change
    create_table :sequencings do |t|
      t.string :sequencing_name
      t.boolean :paired_end
      t.string :distance_cassure
      t.integer :element_id
      t.integer :empcr_id

      t.timestamps
    end
  end
end
