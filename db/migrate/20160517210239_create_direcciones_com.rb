class CreateDireccionesCom < ActiveRecord::Migration
  def change
    create_table :direcciones_com do |t|
      t.string :monoblock
      t.string :escalera
      t.string :piso
      t.string :depto
      t.string :casa
      t.string :manzana
      t.string :observacion

      t.timestamps null: false
    end
  end
end
