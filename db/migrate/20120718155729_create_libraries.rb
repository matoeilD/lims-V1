class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :library_name
      t.text :fragmentation
      t.text :strategy
      t.integer :element_id
      t.string :extraction_assoc

      t.timestamps
    end
  end
end
