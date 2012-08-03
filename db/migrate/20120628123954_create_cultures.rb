class CreateCultures < ActiveRecord::Migration
  def change
    create_table :cultures do |t|
      t.string :culture_name
      t.string :host_strain
      t.integer :element_id
      t.text :contaminants
      t.text :culture_note

      t.timestamps
    end
  end
end
