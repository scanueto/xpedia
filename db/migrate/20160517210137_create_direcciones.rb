class CreateDirecciones < ActiveRecord::Migration
  def change
    create_table :direcciones do |t|
      t.integer :eje_calle_id
      t.integer :calle_id
      t.integer :entre1_id
      t.integer :entre2_id
      t.integer :localidad_id
      t.float :altura
      t.string :descripcion
      t.string :calle
      t.string :entre1
      t.string :entre2
      t.boolean :fidelizacion

      t.timestamps null: false
    end

     add_index :direcciones, [:calle]
     add_index :direcciones, [:calle, :altura]
  end
end
