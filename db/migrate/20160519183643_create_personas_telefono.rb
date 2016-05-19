class CreatePersonasTelefono < ActiveRecord::Migration
  def change
    create_table :personas_telefono do |t|
      t.integer :persona_id
      t.integer :area_id
      t.string :numero
      t.timestamp :fh_alta
      t.string :login_alta
      t.boolean :valido
      t.boolean :principal
      t.string :red_tipo
      t.string :telefono_tipo

      t.timestamps null: false
    end
  end
end
