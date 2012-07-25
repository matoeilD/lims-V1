class CreateSeizespyros < ActiveRecord::Migration
  def change
    create_table :seizespyros do |t|
      t.string :seize_name
      t.integer :data_id
      t.string :seize_tools
      t.string :seize_params
      t.text :seize_output
       t.integer :element_id

      t.timestamps
    end
  end
end
