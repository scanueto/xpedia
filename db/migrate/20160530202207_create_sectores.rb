class CreateSectores < ActiveRecord::Migration
  def change
    create_table :sectores do |t|
      t.string :sector
      t.boolean :habilitado
      t.timestamp :fh_baja

      t.timestamps null: false
    end
  end
end
