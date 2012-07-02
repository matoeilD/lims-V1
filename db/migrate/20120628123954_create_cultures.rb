class CreateCultures < ActiveRecord::Migration
  def change
    create_table :cultures do |t|
      t.string :culturename
      t.integer :element_id

      t.timestamps
    end
  end
end
