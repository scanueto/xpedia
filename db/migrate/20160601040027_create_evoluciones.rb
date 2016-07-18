class CreateEvoluciones < ActiveRecord::Migration
  def change
    create_table :evoluciones do |t|
      t.integer :tramite_id
      t.string :login, limit: 30
      t.integer :sector_origen_id
      t.integer :sector_destino_id
      t.integer :nodo_origen_id
      t.integer :nodo_destino_id
      t.text :observacion
      t.integer :secuencia

      t.timestamps null: false
    end
    add_index :evoluciones, :tramite_id
    add_foreign_key :evoluciones, :sectores, column: :sector_origen_id
    add_foreign_key :evoluciones, :sectores, column: :sector_destino_id
    add_foreign_key :evoluciones, :tramites
  end
end
