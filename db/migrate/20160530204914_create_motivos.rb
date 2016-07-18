class CreateMotivos < ActiveRecord::Migration
  def change
    create_table :motivos do |t|
      t.string :motivo
      t.integer :prioridad
      t.boolean :habilitado

      t.timestamps null: false
    end
  end
end
