class CreateCanales < ActiveRecord::Migration
  def change
    create_table :canales do |t|
      t.string :canal_cod, null: false
      t.string :descripcion

      t.timestamps null: false
    end

    Canal.create(canal_cod:'P', descripcion:'Personal')
    Canal.create(canal_cod:'T', descripcion:'Telefonico')
    Canal.create(canal_cod:'M', descripcion:'Mail')
    Canal.create(canal_cod:'W', descripcion:'Web')
    Canal.create(canal_cod:'C', descripcion:'Chat')
    Canal.create(canal_cod:'N', descripcion:'Nota')
  end
end
