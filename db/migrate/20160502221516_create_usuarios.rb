class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :login, null: false, :limit => 30
      t.string :password_digest
      t.string :nombre, :limit => 50
      t.string :email, :limit => 50
      t.string :telefono, :limit => 25
      t.integer :canal_id
      t.boolean :admin, default: false
      t.timestamp :fh_baja
      t.boolean :habilitado, default: true
      t.timestamp :last_action
      t.string :auth_token
      t.string :password_reset_token
      t.timestamp :password_reset_sent_at

      t.timestamps null: false
    end

    add_index :usuarios, :login, unique: true
    add_index :usuarios, :auth_token
    add_foreign_key :usuarios, :canales
    add_index :usuarios, :email, unique: true

  end
end
