class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.integer :persona_cod, null: false
      t.string :razon, null: false
      t.string :tipo_doc, :limit => 5
      t.string :nro_doc,   :limit => 11
      t.string :sexo,   :limit => 2
      t.string :login_alta, null: false

      t.timestamps null: false
    end
    add_index :personas, :persona_cod
    add_index :personas, :razon
    add_index :personas, [:tipo_doc, :nro_doc], unique: true
  end
end
