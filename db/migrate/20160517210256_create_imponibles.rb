class CreateImponibles < ActiveRecord::Migration
  def change
    create_table :imponibles do |t|
      t.integer :imponible_id
      t.string :imponible_type
      t.timestamp :fh_alta
      t.string :login_alta
      t.string :situacion
      t.integer :titular_id
      t.integer :responsable_pago_id
      t.integer :direccion_id
      t.integer :direccion_com_id
      t.timestamps null: false
    end

    add_foreign_key :imponibles, :usuarios, column: :login_alta, primary_key: :login
    add_foreign_key :imponibles, :personas, column: :titular_id
    add_foreign_key :imponibles, :personas, column: :responsable_pago_id
    add_foreign_key :imponibles, :direcciones, column: :direccion_id
    add_foreign_key :imponibles, :direcciones_com, column: :direccion_com_id

    add_index :imponibles, [:imponible_id, :imponible_type], unique: true
  end
end
