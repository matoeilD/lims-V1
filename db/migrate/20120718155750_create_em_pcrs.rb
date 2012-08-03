class CreateEmPcrs < ActiveRecord::Migration
  def change
    create_table :em_pcrs do |t|
      t.string :EM_PCR_name
      t.string :PCR_round
      t.integer :element_id
      t.string :library_assoc

      t.timestamps
    end
  end
end
