class CreateTramites < ActiveRecord::Migration
  def change
    create_table :tramites do |t|
      t.integer :motivo_id, null: false
      t.integer :sector_id, null: false
      t.string :estado, null: false, :limit => 1
      t.integer :canal_id, null: false
      t.string :login_alta, :limit => 30
      t.string :login_cierre, :limit => 30
      t.timestamp :fh_cierre
      t.integer :prioridad
      t.boolean :auditado, default: false
      t.integer :imponible_id
      t.text :observacion
      t.string :ocupado_por, :limit => 30
      t.string :codigo_externo, :limit => 30
      t.string :login_ult_evo, :limit => 30
      t.timestamp :fh_ult_evo
      t.integer :nodo_id
      t.integer :persona_id

      t.timestamps null: false
    end
    add_index :tramites, :motivo_id
    add_foreign_key :tramites, :motivos
    add_foreign_key :tramites, :canales
    add_foreign_key :tramites, :sectores
    add_foreign_key :tramites, :personas
  end
end
