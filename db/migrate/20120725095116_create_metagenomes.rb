class CreateMetagenomes < ActiveRecord::Migration
  def change
    create_table :metagenomes do |t|
      t.string :meta_name
      t.string :data_assoc
      t.string :meta_tools
      t.string :meta_params
      t.text :meta_output
      t.integer :element_id

      t.timestamps
    end
  end
end
