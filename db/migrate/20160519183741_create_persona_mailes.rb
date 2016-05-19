class CreatePersonaMailes < ActiveRecord::Migration
  def change
    create_table :persona_mailes do |t|
      t.integer :persona_id
      t.timestamp :fh_alta
      t.string :login_alta
      t.boolean :valido
      t.boolean :principal
      t.string :mail

      t.timestamps null: false
    end
  end
end
