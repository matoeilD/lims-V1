class CreateEmPcrs < ActiveRecord::Migration
  def change
    create_table :em_pcrs do |t|
      t.string :EM_PCR_name
      t.boolean :PCR_round
      t.integer :element_id
      t.integer :library_id

      t.timestamps
    end
  end
end
