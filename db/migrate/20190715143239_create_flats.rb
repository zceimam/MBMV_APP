class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :address
      t.text :description
      t.integer :price
      t.references :user, foreign_key:true

      t.futuramatimestamps
    end
  end
end
