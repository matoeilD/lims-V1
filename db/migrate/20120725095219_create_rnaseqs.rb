class CreateRnaseqs < ActiveRecord::Migration
  def change
    create_table :rnaseqs do |t|
      t.string :rnaseq_name
      t.integer :data_id
      t.string :rnaseq_tools
      t.string :rnaseq_params
      t.text :rnaseq_output
      t.string :rnaseq_ref
      t.string :rnaseq_tablecount
       t.integer :element_id

      t.timestamps
    end
  end
end
