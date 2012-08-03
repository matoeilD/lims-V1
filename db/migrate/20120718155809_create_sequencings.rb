class CreateSequencings < ActiveRecord::Migration
  def change
    create_table :sequencings do |t|
      t.string :sequencing_name
      t.string :paired_end
      t.string :distance_cassure
      t.integer :element_id
      t.string :empcr_assoc

      t.timestamps
    end
  end
end
