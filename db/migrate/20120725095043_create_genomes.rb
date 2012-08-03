class CreateGenomes < ActiveRecord::Migration
  def change
    create_table :genomes do |t|
      t.string :genome_name
      t.string :data_assoc
      t.string :genome_type
      t.string :genome_ref
      t.string :genome_params
      t.string :genome_annotateur
      t.integer :genome_nbcontigs
      t.integer :genome_nbscaffold
      t.string :genome_coverage
      t.string :genome_ncinquante
      t.string :genome_size
      t.integer :element_id

      t.timestamps
    end
  end
end
