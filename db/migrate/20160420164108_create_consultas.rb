class CreateConsultas < ActiveRecord::Migration
  def change
    create_table :consultas do |t|
      t.integer :persona_id
      t.text :pregunta, null: false
      t.text :respuesta
      t.integer :id_canal_preg, null: false
      t.integer :id_canal_resp
      t.string :login_alta, null: false 
      t.string :estado, null: false
      t.timestamp :fh_respuesta

      t.timestamps null: false
    end

    add_foreign_key :consultas, :personas
    add_foreign_key :consultas, :canales, column: :id_canal_preg
    add_foreign_key :consultas, :canales, column: :id_canal_resp
    add_index :consultas, :persona_id
  end
end
